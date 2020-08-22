class Flight
    attr_reader :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        return true if @passengers.length == @capacity
        return false
    end

    def board_passenger(passenger)
        if !full?
            if passenger.has_flight?(@flight_number )
                @passengers << passenger
            end
        end
    end

    def list_passengers
        new_name_array = []
        @passengers.each do |passenger|
            new_name_array << passenger.name
        end
        new_name_array
    end

    def [](idx)
        return @passengers[idx]
    end

    def <<(passenger)
        board_passenger(passenger)
    end
end