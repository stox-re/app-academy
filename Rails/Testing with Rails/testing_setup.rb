# Gemfile
group :development, :test do
  gem 'byebug'
  gem 'pry-rails'
  gem 'factory_bot_rails' # automatically create instances of models for testing
  gem 'faker' # goes hand in hand with factory_bot_rails, generates random data
end

group :test do
  gem 'rspec-rails'
  gem 'capybara' # allows us to test our views/features within application # simulate how a user would interact with an application
  gem 'shoulda-matchers', '~>3.1' # one liners to test validations and associations with models, detailed error messages
  gem 'launchy' # launch external applications within rails app
end

group :development do
  gem 'annotate' #bundle exec annotate --models
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'web-console', '>= 3.3.0'
  gem 'spring'
  gem 'listen'
end

# Make sure that none of the gems
# web-console,
# binding_of_caller,
# better_errors,
# is included in the :test group in your Gemfile, as they can give you false positives in your tests.

# rails generate rspec:install

# Then in .rspec
--require spec_helper
--color
--format documentation

# In config/application.rb

module CapyBaraParty
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true

    # we have added in
    config.generators do |g|
      g.test_framework :rspec,
        :fixtures => false,
        :view_specs => false,
        :helper_specs => false,
        :routing_specs => false,
        :controller_specs => true,
        :request_specs => false
      g.fixture_replacement :factory_bot, :dir => "spec/factories"
    end
  end
end