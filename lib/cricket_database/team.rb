require_relative 'players.rb'
require 'pry'
class Team

    attr_accessor :country, :initials, :rank, :matches, :won, :lost, :draw, :points, :players

    def initialize(name = "",initials = "",rank = "",matches = "",won = "",lost = "",draw = "",points = "")
        @@players = []
        if name != ""
            @country = name
            @initials = initials
            @rank = rank
            @matches = matches
            @won = won
            @lost = lost
            @draw = draw
            @points = points
        end
    end

    def create
        puts "\nEnter Team Name."
        @country = getinput.to_s
        puts "\nEnter Team Initials. ex: US"
        @initials = getinput.to_s
        puts "\nEnter Team Rank."
        @rank = getinput.to_i
        puts "\nEnter Matches Played."
        @matches = getinput.to_i
        puts "\nEnter Matches Won."
        @won = getinput.to_i
        puts "\nEnter Matches Lost."
        @lost = getinput.to_i
        puts "\nEnter Matches Draw due to weather or equal score."
        @draw = getinput.to_i
        puts "\nEnter total points team earned."
        @points = getinput.to_i
        player = Players.new
        @@players = player
    end

    def getinput
        return gets.chomp
    end
end