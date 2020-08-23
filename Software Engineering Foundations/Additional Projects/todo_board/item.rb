class Item
    attr_reader :deadline, :done
    attr_accessor :title, :description

    def self.valid_date?(date_string)
        # YYYY-MM-DD format
        split_string = date_string.split("-")
        if split_string.length == 3
            split_string.each_with_index do |ele, idx|
                if (ele.to_i).is_a?(Integer)
                    return false if idx == 0 && split_string[idx].length != 4
                    return false if ele.to_i <= 0
                    return false if idx == 1 && ele.to_i > 12
                    return false if idx == 2 && ele.to_i > 31
                else
                    return false
                end
            end
            return true
        end
        return false
    end

    def initialize(title, deadline, description, done = false)
        raise "Error: Date is not valid." if !Item.valid_date?(deadline)
        @title, @deadline, @description = title, deadline, description
        @done = done
    end

    def deadline=(new_deadline)
        raise "Error: Date is not valid." if !Item.valid_date?(new_deadline)
        @deadline = new_deadline
    end

    def toggle
        @done = !@done
    end
end