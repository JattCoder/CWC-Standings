require_relative 'team.rb'
require 'pry'

class List

    attr_accessor :web_data, :all_stus
    @@all_stus = []
    def initialize(data)
        data.each do |rank,team_data|
            name = team_data[:country]
            initials = team_data[:initials]
            matches = team_data[:matches]
            won = team_data[:won]
            lost = team_data[:lost]
            draw = team_data[:draw]
            points = team_data[:points]
            add_team = Team.new(name,initials,rank,matches,won,lost,draw,points,@@all_stus)
            @@all_stus << add_team
        end
        print
    end

    def start
        new_team = Team.new("","","","","","","","",@@all_stus)
        check = false
        while check == false
            input = getinput.downcase
            if input == "add"
                new_team.create
                check = true
                @@all_stus << new_team
                print
            elsif input == "save"
                save
            elsif input == "exit"
                check = true
                goodbye
            else
                selection = Integer(input) rescue false
                if selection == false
                    puts "Not Appropriate Selection!"
                else
                    if selection > @@all_stus.length
                        puts "Invalid Selection!"
                    else
                        selected = @@all_stus[selection - 1]
                        show_details(selected)
                    end
                end
            end
        end
    end

    def save
        standing_data = File.open("CWC_Standings.txt", "w")
        position = 1
        standing_data.puts "2019 Cricket World Cup Standings\n\n"
        @@all_stus.each do |team_class|
            standing_data.puts "#{position}: #{team_class.country} (#{team_class.initials}) \n     Name: #{team_class.country} \n     Standing: #{team_class.rank} \n     Total Matches: #{team_class.matches} \n     Total Wins: #{team_class.won} \n     Total Loses: #{team_class.lost} \n     Toatl Draw: #{team_class.draw} \n     Total Points: #{team_class.points}\n\n"
            position += 1
        end
        standing_data.close
        puts "Successfully Saved CWC Standings"
    end

    def print
        if @@all_stus.length > 0
            @@all_stus.sort! { |a,b| (a.rank.to_i == b.rank.to_i) ? a.rank.to_i <=> b.rank.to_i : a.rank.to_i <=> b.rank.to_i }
            puts "\nCountries in CWC Standing"
            @@all_stus.each do |team|
                puts "#{team.rank}: #{team.country}"
            end
            puts "\nSelect team to open details or type [ADD] to add new team or type [SAVE] to save data to txt file  or [EXIT] to leave."
        else
            puts "\nFound 0 Teams. Press [ADD] to add new team."
        end
        start
    end

    def goodbye
        puts "Thank you for using Harmandeep's Application. Goodbye"
    end

    def afterdetails(del)
        input = getinput.to_s.downcase
        if input == "back"
            print
        elsif input == "delete"
            @@all_stus.delete_at(del)
            print
        elsif input == "exit"
            goodbye
        else
            puts "Did not recognize your input. Try Again"
            afterdetails(del)
        end
    end

    def getinput
        return input = gets.chomp
    end
    
end