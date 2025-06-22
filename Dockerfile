# syntax=docker/dockerfile:1

ARG RUBY_VERSION=3.2.2
FROM ruby:$RUBY_VERSION-slim as base

WORKDIR /rails

# Set environment
ENV RAILS_ENV=production \
    BUNDLE_DEPLOYMENT=1 \
    BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_WITHOUT="development test"

# Install dependencies common to all stages
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
      curl \
      libpq-dev \
      libvips \
      libsqlite3-0 \
      pkg-config \
      git \
    && rm -rf /var/lib/apt/lists/*

# Throw-away build stage
FROM base as build

# Install build tools for native gems
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential

# Install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install --without development test && \
    rm -rf ~/.bundle "${BUNDLE_PATH}"/ruby/*/cache

# Copy app code
COPY . .

# Optional: Precompile any needed bootsnap or config
RUN bundle exec bootsnap precompile --gemfile && \
    bundle exec bootsnap precompile app/ lib/

# Final image
FROM base

# Copy built bundle and app code
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails /rails

# Add non-root user
RUN useradd rails --create-home --shell /bin/bash && \
    chown -R rails:rails /rails
USER rails

# Entrypoint setup (uses bin/docker-entrypoint from Rails)
ENTRYPOINT ["bin/docker-entrypoint"]

# Expose app port
EXPOSE 3000

# Default command
CMD ["bin/rails", "server"]
