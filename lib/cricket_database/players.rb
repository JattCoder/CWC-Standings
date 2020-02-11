class Players

    attr_accessor :name, :role, :list

    def initialize
        @list = []
    end

    def addplayer
        puts "\nEnter Player Name"
        @name = gets.chomp.to_s
        puts "\nEnter Player Role (Batter or Bowler or All-Rounder"
        @role = gets.chomp.to_s
        puts "\n\nWould you like to add another player. (Y/n)"
        @list << self
        binding.pry
        input = getinput.downcase
        if input == "y"
            addplayer
        elsif input == "n"
            #lets go back
        else
            puts "\nSorry, did not recognize your selection."
        end
    end

    def getinput
        return gets.chomp
    end

end