require 'open-uri'
require 'nokogiri'
require 'pry'
require_relative 'list'
class StudentsDatabase::CLI

    def call
        index_url = "https://www.cricketworldcup.com/standings"
        html = open(index_url)
        doc = Nokogiri::HTML(html)
        data = doc.css("td").text.split(" ")
        standing = Hash.new
        puts "\nWelcome to Cricket World Cup Standings. Would you like to add new Team to Standings? (Y/n)"
        if data
            puts "Found Cricket World Cup Standings"
            startapp(data)
        else
            puts "Failed to find Standings online. Try Again? (Y/n)"
            input = gets.chomp.downcase
            if input == "y"
                call
            elsif input == "n"
                startapp(data = nil)
            else
                puts "Wrong Selection! Trying Again..."
            end
        end
    end

    def startapp(info)
        start_app = List.new(info)
        start_app.start
    end

end