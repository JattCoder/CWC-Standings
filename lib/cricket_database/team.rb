require 'pry'
class Team

    attr_accessor :country, :initials, :rank, :matches, :won, :lost, :draw, :points, :rank_available

    def initialize(name = "",initials = "",rank = "",matches = "",won = "",lost = "",draw = "",points = "",rank_available)
        @@rank_available = []
        @@rank_available = rank_available
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
        rank_open = true
        while rank_open == true
            puts "\nEnter Team Rank."
            @rank = getinput.to_i
            if @rank == 0
                puts "Rank #{0} is not available!"
            else
                rank_open = check_position(@rank)
                if rank_open == true
                    puts "Sorry. Rank #{@rank} is occupied!"
                end
            end
        end
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
    end

    def check_position(position)
        selected = @@rank_available[position - 1]
        if position > @@rank_available.length
            false
        else
            if selected.rank.to_i == position
                true
            else
                false
            end
        end
    end

    def getinput
        return gets.chomp
    end
end