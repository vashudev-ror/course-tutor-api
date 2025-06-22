source "https://rubygems.org"

ruby "3.2.2"

gem "rails", "~> 7.1.3", ">= 7.1.3.4"
gem 'pg', '>= 1.1'
gem "puma", ">= 5.0"

gem 'bcrypt', '~> 3.1.7'

# JSON Web Tokens (JWT Auth)
gem "jwt"

gem 'active_model_serializers', '~> 0.10.0'
gem 'kaminari'

# Rack CORS for API accessibility (optional but good practice)
gem "rack-cors"

# Optional: for JSON serialization
# gem "jbuilder"
gem "pry"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false

group :development, :test do
  # Testing
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "faker"
  gem 'shoulda-matchers', '~> 5.0'
  gem "simplecov", require: false

  # Linting & style
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
end

group :development do
  gem "debug", platforms: %i[ mri windows ]
end
