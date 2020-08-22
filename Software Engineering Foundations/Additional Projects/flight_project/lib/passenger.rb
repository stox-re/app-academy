class Passenger
    attr_reader :name

    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(flight_number)
        @flight_numbers.each do |check|
            if check.upcase == flight_number.upcase
                return true
            end
        end
        return false
    end

    def add_flight(flight_number)
        if has_flight?(flight_number)
            return
        else
            @flight_numbers << flight_number.upcase
        end
    end
end

# new_passenger = Passenger.new("Rose")
# new_passenger.instance_variable_set(:@flight_numbers, ["J512", "AA128"])
# p new_passenger.has_flight?("aa128")