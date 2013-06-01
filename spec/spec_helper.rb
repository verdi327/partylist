require 'spork'
require "vcr"

#Spork.prefork do

  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'

  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }


  VCR.configure do |c|
    c.cassette_library_dir = 'spec/vcr'
    c.default_cassette_options = { :record => :new_episodes }
    c.hook_into :typhoeus
  end

  RSpec.configure do |config|
    config.treat_symbols_as_metadata_keys_with_true_values = true

    config.around(:each, :vcr) do |example|
      name = example.metadata[:full_description].split(/\s+/, 2).join("/").underscore.gsub(/[^\w\/]+/, "_")
      options = {}
      options[:record] = example.metadata[:record] if example.metadata[:record]
      VCR.use_cassette(name, options) { example.call }
    end
    config.fixture_path = "#{::Rails.root}/spec/fixtures"
    config.use_transactional_fixtures = true
    config.infer_base_class_for_anonymous_controllers = false
    config.order = "random"
  end

# end

Spork.each_run do
  # This code will be run each time you run your specs.

end
