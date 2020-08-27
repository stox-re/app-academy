require 'colorize'

class Tile
    attr_reader :type

    def initialize(type)
        @type = type
    end

    def to_s
        case type
        when "_"
            (type.to_s).colorize(:light_blue)
        when "F"
            (type.to_s).colorize(:orange)
        when "X"
            (type.to_s).colorize(:red)
        when Integer
            (type.to_s).colorize(:blue)
        end
    end
end