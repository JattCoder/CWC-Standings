class Under

    attr_accessor :year, :school

    def initialize
        puts "\nWhat School is the Student studying in?"
        @school = getinput.to_s
        puts "\nWhat is the expected year of Graduation?"
        @year = getinput.to_i
    end

    def getinput
        return gets.chomp
    end
end