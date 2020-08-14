require_relative "room"

class Hotel
    def initialize(name, hash)
        @name = name
        @rooms = {}
        hash.each do |key, value|
            @rooms[key] = Room.new(value)
        end
    end

    def name
        @name.split(" ").map(&:capitalize).join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(name)
        @rooms.has_key?(name)
    end

    def check_in(person, room_name)
        if room_exists?(room_name)
            add_occupant_result = @rooms[room_name].add_occupant(person)
            if add_occupant_result
                p "check in successful"
            else
                p "sorry, room is full"
            end
        else
            p "sorry, room does not exist"
        end
    end

    def has_vacancy?
        @rooms.values.any? { |room| room.available_space > 0 }
    end

    def list_rooms
        @rooms.each do |key, value|
            puts key + ".*" + @rooms[key].available_space.to_s
        end
    end
end
