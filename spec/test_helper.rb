require 'capybara/rspec'
require 'selenium-webdriver'
require 'pry-byebug'
require 'site_prism'

Capybara.default_driver = :selenium_chrome

BASE_URL = 'https://start.ro.co/'.freeze
