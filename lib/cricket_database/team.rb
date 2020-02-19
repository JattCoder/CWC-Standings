require 'pry'
class Team

    attr_accessor :country, :initials, :rank, :matches, :won, :lost, :draw, :points
    @@teams = []
    def create_from_hash(attributes)
        if attributes[0] != ""
            @country = attributes[0]
            @initials = attributes[1]
            @rank = attributes[2]
            @matches = attributes[3]
            @won = attributes[4]
            @lost = attributes[5]
            @draw = attributes[6]
            @points = attributes[7]
            @@teams << self
        end
    end

    def create(teams)
        puts "\nEnter Team Name."
        @country = getinput
        puts "\nEnter Team Initials. ex: US"
        @initials = getinput
        rank_open = true
        while rank_open == true
            puts "\nEnter Team Rank."
            @rank = getinput.to_s
            if @rank == "0"
                puts "\nRank #{@rank} is not available!"
            else
                rank_open = check_position(teams)
            end
        end
        puts "\nEnter Matches Played."
        @matches = getinput
        puts "\nEnter Matches Won."
        @won = getinput
        puts "\nEnter Matches Lost."
        @lost = getinput
        puts "\nEnter Matches Draw due to weather or equal score."
        @draw = getinput
        puts "\nEnter total points team earned."
        @points = getinput
        teams.insert((@rank.to_i - 1),self)
    end

    def check_position(teams)
        if @rank.to_i > (teams.length + 1)
            puts "We can not skip position ##{teams[teams.length - 1].rank.to_i + 1}"
            return true
        else
            teams.each do |team|
                if team.rank == @rank
                    puts "\nRank #{@rank} is occupied!"
                    return true
                end
            end
            return false
        end
    end

    def getinput
        return gets.chomp.to_s
    end
end