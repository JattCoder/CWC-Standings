require_relative 'grad.rb'
require_relative 'under_grad.rb'
require 'pry'
class Student

    attr_accessor :name, :age, :major, :grad, :year, :school

    def create
        puts "\nEnter Student Name."
        @name = getinput.to_s
        puts "\nEnter Student Age."
        @age = getinput.to_i
        puts "\nEnter Student Major."
        @major = getinput.to_s
        puts "\nIs Student Graduated? (Y/n)"
        selection = getinput.to_s.downcase
        if selection == "y"
            @grad = true
            school_year = Graduated.new
            @school = school_year.school
            @year = school_year.year
        elsif selection == "n"
            @grad = false
            school_year = Under.new
            @school = school_year.school
            @year = school_year.year
        else
            puts "Please choose (Y/n)"
        end
    end

    def getinput
        return gets.chomp
    end
end