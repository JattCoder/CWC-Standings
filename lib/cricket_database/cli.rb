require 'pry'
require_relative 'scrape'
require_relative 'team'

class CricketDatabase::CLI

    attr_accessor :teams

    def initialize
        webdata = Scrape.new
        @teams = webdata.teams
    end

    def startapp
        @teams.printlist
        getinput
    end

    def exit
        puts "Thank you for using Harmandeep's Application."
    end

    def getinput
        previous = @teams.select
        input = gets.chomp.downcase
        selection = Integer(input) rescue false
        if selection == false
            if input == "add"
                @teams.create
                getinput
            elsif input == "save"
                @teams.save_to_file
                getinput
            elsif input == "back"
                if previous != ""
                    @teams.select = ""
                    @teams.printlist
                end
                getinput
            elsif input == "delete"
                @teams.delete(previous)
                getinput
            elsif input == "exit"
                exit
            else
                puts "Invalid Input!"
            end
        else
            @teams.printdata(selection)
            getinput
        end
    end

end