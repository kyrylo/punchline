ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)

require 'minitest/autorun'
require 'minitest/rails'

# Uncomment if you want Capybara in accceptance/integration tests.
require 'minitest/rails/capybara'

# Uncomment if you want awesome colorful output
# require 'minitest/pride'

# Run Capybara tests on a headless WebKit browser, provided by PhantomJS. You
# need at least PhantomJS 1.7.0. There are no other external dependencies (you
# don't need Qt, or a running X server, etc.).
require 'capybara/poltergeist'

class MiniTest::Rails::ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  # fixtures :all

  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app)
  end
  Capybara.current_driver = :poltergeist
end

# Do you want all existing Rails tests to use MiniTest::Rails?
# Comment out the following and either:
# A) Change the require on the existing tests to `require "minitest_helper"`
# B) Require this file's code in test_helper.rb

# MiniTest::Rails.override_testunit!
