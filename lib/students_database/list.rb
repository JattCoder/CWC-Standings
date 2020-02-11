require_relative 'student.rb'
require 'pry'

class List

    attr_accessor :web_data

    def initialize(data)
        @web_data = data
        @@all_stus = []
        @just 
    end

    def start
        binding.pry
        new_stu = Student.new
        check = false
        while check == false
            input = getinput.downcase
            if input == "y"
                new_stu.create
                check = true
                @@all_stus << new_stu
                message
            elsif input == "n"
                check = true
                print_stus
            else 
                puts "Please select (Y/n)"
            end
        end
    end

    def message
        puts "\nWould you like to add more Students? (Y/n)"
        start
    end

    def print_stus
        id = 001
        puts "\nHere is the list of Students."
        @@all_stus.each do |student|
            puts "#{id}: #{student.name}"
            id += 1
        end
        show_details
    end

    def show_details
        puts "\nType Name or Number or Exit to Main-Menu."
        input = gets.chomp
        selection = Integer(input) rescue false
        binding.pry
        if selection && (selection - 1) < @@all_stus.length
            stu_info = @@all_stus[selection - 1]
            puts "Name: #{stu_info.name}\nAge: #{stu_info.age}\nMajor: #{stu_info.major}\nGraduated: #{stu_info.grad}\nYear: #{stu_info.year}\nSchool: #{stu_info.school}\n"
            print_stus
        elsif !selection
            @@all_stus.select do |stu_info|
                puts "Name: #{stu_info.name}\nAge: #{stu_info.age}\nMajor: #{stu_info.major}\nGraduated: #{stu_info.grad}\nYear: #{stu_info.year}\nSchool: #{stu_info.school}\n" if input == stu_info.name
            end
            print_stus
        else
            puts "Please enter valid Name or ID."
            show_details
        end
    end

    def getinput
        return input = gets.chomp
    end
    
end