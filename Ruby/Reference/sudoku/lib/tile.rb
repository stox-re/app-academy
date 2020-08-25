require 'colorize'

class Tile
    attr_reader :value, :given
    def initialize(value, given)
        @value = value
        @given = given
    end

    def value=(value)
        if @given
            @value = value
            return true
        else
            puts "This value was already set."
        end
    end

    def to_s
        if !@given
            return (value.to_s).colorize(:red)
        elsif @value != 0
            return (value.to_s).colorize(:light_blue)
        else
            return value.to_s
        end
    end
end