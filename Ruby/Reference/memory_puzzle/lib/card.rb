class Card
    attr_reader :face_value, :face_down
    def initialize(face_value)
        @face_value = face_value
        @face_down = true
    end

    def face_up=(is_up)
        @face_down = !is_up
    end

    def display
        return " " if @face_down
        return @face_value if !@face_down
    end
end