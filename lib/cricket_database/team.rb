require 'pry'
class Team

    attr_accessor :country, :initials, :rank, :matches, :won, :lost, :draw, :points, :teams, :select
    @@teams = []
    def initialize(attributes)
        @select = ""
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

    def create
        puts "\nEnter Team Name."
        @country = getinput
        puts "\nEnter Team Initials. ex: US"
        @initials = getinput
        rank_open = true
        while rank_open == true
            puts "\nEnter Team Rank."
            @rank = getinput
            if @rank == 0
                puts "\nRank #{@rank} is not available!"
            else
                rank_open = check_position(@rank)
                if rank_open == true
                    puts "\nRank #{@rank} is occupied!"
                end
            end
        end
        binding.pry
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
        binding.pry
    end

    def check_position(position)
        @@teams.each do |team|
            return true if team.position == position
        end
        false
    end

    def printlist
        puts "\n List of teams."
        @@teams.each do |team|
            puts "   #{team.rank}. #{team.country}"
        end
        puts "\nSelect team to open details or type [ADD] to add new team or type [SAVE] to save data to txt file  or [EXIT] to leave."
    end

    def printdata(position)
        if position <= @@teams.length
            @select = position
            selected = @@teams[position - 1]
            puts "\n"
            puts "#{selected.rank}. #{selected.country}:"
            puts "    Name: #{selected.country} (#{selected.initials})"
            puts "    Standing: #{selected.rank}"
            puts "    Total Matches: #{selected.matches}"
            puts "    Total Wins: #{selected.won}"
            puts "    Total Loses: #{selected.lost}"
            puts "    Total Draw: #{selected.draw}"
            puts "    Total Points: #{selected.points}"
            puts "\nType [DELETE] to delete #{selected.country} or [BACK] to go back to WCW Standings or [EXIT] to leave."
        else
            puts "Invalid Selection. Try Again"
        end
        
    end

    def save_to_file
        standing_data = File.open("CWC_Standings.txt", "w")
        position = 1
        standing_data.puts "2019 Cricket World Cup Standings\n\n"
        @@teams.each do |team_class|
            standing_data.puts "#{position}: #{team_class.country} (#{team_class.initials}) \n     Name: #{team_class.country} \n     Standing: #{team_class.rank} \n     Total Matches: #{team_class.matches} \n     Total Wins: #{team_class.won} \n     Total Loses: #{team_class.lost} \n     Toatl Draw: #{team_class.draw} \n     Total Points: #{team_class.points}\n\n"
            position += 1
        end
        standing_data.close
        puts "Successfully Saved CWC Standings"
        printlist
    end

    def delete(position)
        @@teams.delete_at(position)
        printlist
    end

    def getinput
        return gets.chomp.to_s
    end
end