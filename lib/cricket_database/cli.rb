class CricketDatabase::CLI

    attr_accessor :teams, :selection

    def initialize
        webdata = Scrape.new
        @teams = webdata.teams
        puts "\n Welcome to 2019 CWC Standings."
    end

    def startapp
        Service.new.printlist(@teams)
        getinput
    end

    def getinput
        input = gets.chomp.downcase
        selection = Integer(input) rescue false
        if selection == false
            if input == "add"
                newclass = Team.new.create(@teams)
                startapp
            elsif input == "save"
                Service.new.save_to_file(@teams)
                startapp
            elsif input == "back"
                @selection = ""
                startapp
            elsif input == "delete"
                @teams = Service.new.delete(@selection.to_i,@teams)
                startapp
            elsif input == "exit"
                exit
            else
                puts "Invalid Input! Try Again."
                getinput
            end
        else
            Service.new.printdata(input,@teams)
            @selection = input.to_s
            getinput
        end
    end

    def exit
        puts "\nThank you for using Harmandeep's Application.\n\n"
    end

end