source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.5.3"
gem "rubocop", "~> 0.54.0", require: false

gem "bcrypt", "3.1.12"
gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap-sass", "3.3.7"
gem "config"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "puma", "~> 3.11"
gem "rails", "~> 5.2.2"
gem "rails-i18n"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "turbolinks"
gem "sqlite3"
gem "faker"
gem "kaminari"
gem "bootstrap-kaminari-views"
gem "carrierwave", "1.2.2"
gem "mini_magick", "4.7.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "chromedriver-helper"
  gem "selenium-webdriver"
end

group :production do
  gem "pg", "0.20.0"
  gem "fog", "1.42"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
