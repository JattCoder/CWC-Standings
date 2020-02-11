require_relative 'players.rb'
require 'pry'
class Team

    attr_accessor :name, :rank, :matches, :won, :lost, :draw, :players

    def initialize(name,rank,matches,won,lost,draw)
        @@players = []
        if name != ""
            @name = name
            @rank = rank
            @matches = matches
            @won = won
            @lost = lost
            @draw = draw
        end
    end

    def create
        puts "\nEnter Team Name."
        @name = getinput.to_s
        puts "\nEnter Team Rank."
        @rank = getinput.to_i
        puts "\nEnter Matches Played."
        @matches = getinput.to_i
        puts "\nEnter Matches Won"
        @won = getinput.to_i
        puts "\nEnter Matches Lost"
        @lost = getinput.to_i
        puts "\nEnter Matches Draw due to weather or equal score"
        @draw = getinput.to_i
        player = Players.new
        @@players = player
        binding.pry
    end

    def getinput
        return gets.chomp
    end
end