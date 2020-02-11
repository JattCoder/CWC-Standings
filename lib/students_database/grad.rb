class Graduated

    attr_accessor :school, :year

    def initialize
        puts "\nWhat School was the Student Graduated from?"
        @school = getinput.to_s
        puts "\nIn what year the student was graduated in?"
        @year = getinput.to_i
    end

    def getinput
        return gets.chomp
    end

end