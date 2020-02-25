class Service

    def printlist(teams)
        puts "\n List of teams."
        teams.sort! { |team1, team2|  team1.rank.to_i <=> team2.rank.to_i }
        teams.each do |team|
            puts "   #{team.rank}. #{team.country}"
        end
        puts "\nSelect team to open details or type [ADD] to add new team or type [SAVE] to save data to txt file  or [EXIT] to leave."
    end

    def printdata(position,teams)
        found = false
        teams.each do |selected|
            if selected.rank == position
                found = true
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
            end
        end
        puts "Invalid Selection! Try again." if found == false
    end

    def save_to_file(teams)
        standing_data = File.open("CWC_Standings.txt", "w")
        standing_data.puts "2019 Cricket World Cup Standings\n\n"
        teams.each do |team_class|
            standing_data.puts "#{team_class.rank}: #{team_class.country} (#{team_class.initials}) \n     Name: #{team_class.country} \n     Standing: #{team_class.rank} \n     Total Matches: #{team_class.matches} \n     Total Wins: #{team_class.won} \n     Total Loses: #{team_class.lost} \n     Toatl Draw: #{team_class.draw} \n     Total Points: #{team_class.points}\n\n"
        end
        standing_data.close
        puts "Successfully Saved CWC Standings"
    end

    def delete(position,teams)
        teams.delete_if do |team|
            position == team.rank.to_i
        end
        teams
    end

end