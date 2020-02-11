require 'open-uri'
require 'nokogiri'
require 'pry'
require_relative 'list'
class CricketDatabase::CLI

    def call
        index_url = "https://www.cricketworldcup.com/standings"
        html = open(index_url)
        doc = Nokogiri::HTML(html)
        data = doc.css("td").text.strip
        standing = Hash.new
        puts "\nWelcome to Cricket World Cup Standings."
        if data
            puts "*****Found Cricket World Cup Standings ----- @ -- www.cricketworldcup.com******"
            puts "\nSelect team to open details or press (Y/y) to add new team."
            fixdata(data)
        else
            puts "Failed to find Standings online. Try Again? (Y/n)"
            input = gets.chomp.downcase
            if input == "y"
                call
            elsif input == "n"
                startapp(Hash.new)
            else
                puts "Wrong Selection! Trying Again..."
            end
        end
    end       

    def fixdata(data)
        team_hash = Hash.new
        data = data.split("\n")
        data.delete_if do |element|
            true if element.strip.empty?
        end
        country = ""
        initials = ""
        hash_position = 1
        position = 1
        count = 0
        while count < data.length
            data[count] = data[count].strip
            remove_special_chars = data[count].gsub!(/[^0-9A-Za-z]/, '')
            check = Integer(remove_special_chars) rescue false
            if check  != false
                if check.to_s.length == 1
                    #do nothing at this point
                else
                    getscore = data[count][0...(((hash_position + 1).to_s.length) * -1)]
                    getscore = getscore[9...getscore.length]
                    team_hash[hash_position.to_s] = {
                        :country => country,
                        :initials => initials,
                        :matches => data[count][0],
                        :won => data[count][1],
                        :lost => data[count][2],
                        :draw => data[count][3],
                        :points => getscore
                    }
                    hash_position += 1
                end
            else
                if data[count].upcase == data[count]
                    initials = data[count]
                else
                    country = data[count]
                end

            end
            count += 1
        end
        startapp(team_hash)  
    end

    def startapp(data)
        start_app = List.new(data)
        start_app.start
    end

end