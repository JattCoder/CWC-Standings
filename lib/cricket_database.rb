require_relative "cricket_database/version"
require_relative 'cricket_database/scrape'
require_relative 'cricket_database/team'
require_relative 'cricket_database/service'
require_relative "cricket_database/cli"
require 'open-uri'
require 'nokogiri'
require 'pry'

module CricketDatabase
  class Error < StandardError; end
  # Your code goes here...
end
