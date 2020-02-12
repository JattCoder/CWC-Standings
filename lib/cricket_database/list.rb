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
            add_team = Team.new(name,initials,rank,matches,won,lost,draw,points)
            @@all_stus << add_team
        end
        if @@all_stus.length > 0
            puts "\nCountries in CWC Standing"
            @@all_stus.each do |team|
                puts "#{team.rank}: #{team.country}"
            end
            puts "\nSelect team to open details or type [ADD] to add new team or [EXIT] to leave."
        else
            puts "\nFound 0 Teams. Press (Y/y) to add new team."
        end
        start
    end

    def start
        new_team = Team.new("","","","","","","","")
        check = false
        while check == false
            input = getinput.downcase
            if input == "add"
                new_team.create
                check = true
                @@all_stus << new_team
                message
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

    def goodbye
        puts "Thank you for using Harmandeep's Application. Goodbye"
    end

    def show_details(selected)
        puts "#{selected.rank}. #{selected.country}:"
        puts "    Name: #{selected.country} (#{selected.initials})"
        puts "    Standing: #{selected.rank}"
        puts "    Total Matches: #{selected.matches}"
        puts "    Total Wins: #{selected.won}"
        puts "    Total Loses: #{selected.lost}"
        puts "    Total Draw: #{selected.draw}"
        puts "    Total Points: #{selected.points}"
        puts "\nType [BACK] to go back to WCW Standings or [EXIT] to leave."
        afterdetails
    end

    def afterdetails
        input = getinput.to_s.downcase
        if input == "back"
            puts "\nCountries in CWC Standing"
            @@all_stus.each do |team|
                puts "#{team.rank}: #{team.country}"
            end
            puts "\nSelect team to open details or type [ADD] to add new team or [EXIT] to leave."
            start
        elsif input == "exit"
            goodbye
        else
            puts "Did not recognize your input. Try Again"
            afterdetails
        end
    end

    def message
        puts "\nWould you like to add more teams in Standing? (Y/n)"
        start
    end

    def getinput
        return input = gets.chomp
    end
    
end