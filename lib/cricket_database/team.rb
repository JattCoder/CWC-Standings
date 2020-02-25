require 'pry'
class Team

    attr_accessor :country, :initials, :rank, :matches, :won, :lost, :draw, :points
    @@teams = []
    def create_from_hash(attributes)
        if attributes[0] != ""
            @country = attributes[0]
            @initials = attributes[1]
            @rank = attributes[2]
            @matches = attributes[3]
            @won = attributes[4]
            @lost = attributes[5]
            @draw = attributes[6]
            @points = attributes[7]
            @@teams << self
        end
    end

    def print
        binding.pry
    end
end