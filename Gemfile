source 'https://rubygems.org'
ruby '1.9.3'

# A web-application framework that includes everything needed to create
# database-backed web applications according to the Model-View-Controller (MVC)
# pattern. It's all about Rails.
# Source code: https://github.com/rails/rails
gem 'rails', '= 3.2.8'

# The Ruby interface to the PostgreSQL RDBMS.
# Source code: https://bitbucket.org/ged/ruby-pg/wiki/Home
gem 'pg', '~> 0.14.1'

# A gem to automate using jQuery.
# Source code: https://github.com/rails/jquery-rails
gem 'jquery-rails'

# Russian language support.
# Source code: https://github.com/yaroslav/russian
gem 'russian', '~> 0.6.0'

# Gems used only for assets and not required in production environments by
# default.
group :assets do
 # This gem provides official integration for ruby on rails projects with the
  # Sass stylesheet language.
  # Source code: https://github.com/rails/sass-rails
  gem 'sass-rails',   '~> 3.2.3'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  # Ruby wrapper for UglifyJS JavaScript compressor.
  # Source code: https://github.com/lautis/uglifier
  gem 'uglifier', '>= 1.0.3'

  # A Stylesheet Authoring Environment that makes a website design simpler to
  # implement and easier to maintain.
  # Source code: https://github.com/chriseppstein/compass
  gem 'compass', '~> 0.12.2'

  # A Rails adapter for Compass.
  # Source code: https://github.com/Compass/compass-rails
  gem 'compass-rails', '~> 1.0.3'

  # Susy is a semantic CSS grid system with a responsive twist.
  # Source code: https://github.com/ericam/susy
  gem 'susy', '~> 1.0.3'
end

group :test do
  # Capybara integration for MiniTest::Rails.
  # Source code: https://github.com/blowmage/minitest-rails-capybara
  gem 'minitest-rails-capybara', '~> 0.1'

  # A fixtures replacement with a straightforward definition syntax.
  # Source code: https://github.com/thoughtbot/factory_girl_rails
  gem 'factory_girl_rails', '~> 4.1.0'

  # A PhantomJS driver for Capybara. It allows to run Capybara tests on a
  # headless WebKit browser, provided by PhantomJS.
  # Source code: https://github.com/jonleighton/poltergeist
  gem 'poltergeist', '~> 1.0.2'
end

group :test, :development do
  # MiniTest integration.
  # Source code: https://github.com/blowmage/minitest-rails
  gem 'minitest-rails'

  # An IRB alternative and runtime developer console.
  # Source code: https://github.com/pry/pry
  gem 'pry'

  # Allows you to use gems not in your Gemfile from Pry.
  # Source code: https://github.com/ConradIrwin/pry-debundle
  gem 'pry-debundle'

  # Rails 3 Pry initializer.
  # Source code: https://github.com/rweng/pry-rails
  gem 'pry-rails'
end
