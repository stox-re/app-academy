class Room
    def initialize(capacity)
        @occupants = []
        @capacity = capacity
    end

    def capacity
        @capacity
    end

    def occupants
        @occupants
    end

    def full?
        if @occupants.length < @capacity
            return false
        else
            return true
        end
    end

    def available_space
        return @capacity - @occupants.length
    end

    def add_occupant(name)
        if full?
            return false
        else
            @occupants << name
            return true
        end
    end
end
