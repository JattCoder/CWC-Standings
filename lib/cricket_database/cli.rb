class CricketDatabase::CLI

    attr_accessor :teams, :selection

    def initialize
        webdata = Scrape.new
        @teams = Team.all
        binding.pry
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
                addnew
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

    def addnew
        attributes = []
        puts "\nEnter Team Name."
        attributes << country = gets.chomp.to_s
        puts "\nEnter Team Initials. ex: US"
        attributes << initials = gets.chomp.to_s
        rank_open = true
        while rank_open == true
            puts "\nEnter Team Rank."
            rank = gets.chomp.to_s
            if rank == "0"
                puts "\nRank #{rank} is not available!"
            else
                rank_open = check_position(rank)
                attributes << rank if rank_open == false
            end
        end
        puts "\nEnter Matches Played."
        attributes << matches = gets.chomp.to_s
        puts "\nEnter Matches Won."
        attributes << won = gets.chomp.to_s
        puts "\nEnter Matches Lost."
        attributes << lost = gets.chomp.to_s
        puts "\nEnter Matches Draw due to weather or equal score."
        attributes << draw = gets.chomp.to_s
        puts "\nEnter total points team earned."
        attributes << points = gets.chomp.to_s
        newteam = Team.new.create_from_hash(attributes)
    end

    def check_position(rank)
        has = false
        lastposition = @teams[@teams.length - 1].rank.to_i + 1
        all_nums = (1...lastposition).to_a
        occupied = []
        @teams.each do |team|
            if team.rank.to_i == rank.to_i
                puts "Rank #{rank.to_i} is Occupied!"
                return true
            end
            occupied << team.rank.to_i
        end
        getmissing = all_nums - occupied
        if getmissing.include?(rank.to_i)
            index_num = getmissing.find_index(rank.to_i)
            count = index_num
            loop_to = getmissing.length
            while count < loop_to
                getmissing.delete_at(index_num)
                count += 1
            end
            if getmissing.length > 0
                puts "These positions are still missing."
                getmissing.each do |position|
                    puts ":Position #{position}"
                end
                return true
            else
                return false
            end
        else
            if rank.to_i > (@teams[@teams.length - 1].rank.to_i + 2)
                puts "Position #{@teams[@teams.length - 1].rank.to_i + 1} is still missing."
                return true
            else
                if getmissing.length > 0
                    puts "These positions are still missing."
                    getmissing.each do |position|
                        puts ":Position #{position}"
                    end
                    return true
                else
                    return false
                end 
            end
        end
    end

    def exit
        puts "\nThank you for using Harmandeep's Application.\n\n"
    end

end