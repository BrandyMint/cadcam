require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV["RAILS_ENV"] ||= 'test'
  require 'simplecov'
  require 'simplecov-rcov'
  SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
  SimpleCov.start 'rails'

  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'capybara-screenshot/rspec'

  if ENV['PARALLEL_TEST_GROUPS']
    Paperclip::Attachment.default_options[:path] = ":rails_root/public/system/:rails_env/#{ENV['TEST_ENV_NUMBER'].to_i}/:class/:attachment/:id_partition/:filename"
  else
    Paperclip::Attachment.default_options[:path] = ":rails_root/public/system/:rails_env/:class/:attachment/:id_partition/:filename"
  end
  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.include RSpec::Rails::RequestExampleGroup, type: :request, example_group: {
      file_path: /spec\/api/
    }
  end
  # ResqueSpec.disable_ext = true

  RSpec.configure do |config|
    # ## Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr

    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    config.fail_fast = false

    config.include FactoryGirl::Syntax::Methods


    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = false

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false

    # Run specs in random order to surface order dependencies. If you find an
    # order dependency and want to debug it, you can fix the order by providing
    # the seed, which is printed after each run.
    #     --seed 1234
    config.order = "random"

    config.before(:suite) do
      #DatabaseCleaner.strategy = :truncation, {
        #:except => %w[]
      #}
    end
    config.before(:each) do
      DatabaseCleaner.start
      #Warden.test_reset! 
    end
    config.after(:each) do
      DatabaseCleaner.clean
      `rm -rf "#{Rails.root}/public/system/#{Rails.env}"`
      #Hotel.tire.index.delete
      #Hotel.tire.create_elasticsearch_index
    end
  end

end

Spork.each_run do
  if Spork.using_spork?
    ActiveSupport::Dependencies.clear
    ActiveRecord::Base.instantiate_observers

    # Иначе jobs не пеергружаются
    #Dir[Rails.root + "app/**/*.rb"].each do |file|
      #load file
    #end
  end
end
