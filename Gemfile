source "https://rubygems.org"

ruby "3.2.2"

# Rails & core dependencies
gem "rails", "~> 7.1.3", ">= 7.1.3.4"
gem "pg", ">= 1.1"                         # PostgreSQL
gem "puma", ">= 5.0"                       # App server
gem "bcrypt", "~> 3.1.7"                   # Password hashing
gem "jwt"                                  # JSON Web Token auth
gem "kaminari"                             # Pagination
gem "active_model_serializers", "~> 0.10.0" # JSON serializers

# Development tools                        # Debugging console
gem "bootsnap", require: false             # Faster boots
gem "rack-cors"                            # Cross-origin requests (API CORS)

# Windows platform compatibility
gem "tzinfo-data", platforms: %i[windows jruby]

group :development, :test do
  # Testing stack
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "faker"
  gem "shoulda-matchers", "~> 5.0"
  gem "simplecov", require: false

  # Code quality
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
end

group :development do
  gem "debug", platforms: %i[mri windows]  # Debugging
end

# Optional:
# gem "jbuilder" # For JSON views, not needed with AMS
