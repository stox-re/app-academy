require_relative "./card.rb"

class Board
    attr_reader :size
    def initialize(size)
        @size = size
        @board_array = Array.new(@size) { Array.new(@size, nil) }
    end

    def pick_size_items_random
        types = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        types = types.split("")
        new_array = []
        complete = false

        while !complete
            if new_array.length < ((@size * @size) / 2)
                take_sample = types.sample
                if !new_array.include?(take_sample)
                    new_array << take_sample
                end
            else
                complete = true
            end
        end

        new_array
    end

    def generate_random_pair_array
        new_2d_array = []
        random_items = pick_size_items_random
        complete = false
        counts = {}

        random_items.each do |item|
            counts[item] = 0
        end

        while !complete

            if counts.has_value?(0) || counts.has_value?(1)
                take_sample = random_items.sample
                if counts[take_sample] < 2
                    new_2d_array << take_sample
                    counts[take_sample] += 1
                end
            else
                complete = true
            end

        end

        new_2d_array
    end

    def populate
        random_pairs = generate_random_pair_array
        count = 0

        @board_array.each_with_index do |sub_array, idx|
            sub_array.each_with_index do |ele, ele_idx|
                @board_array[idx][ele_idx] = Card.new(random_pairs[count])
                count += 1
            end
        end

        puts "".ljust(20, "-") + " Board is Ready ".ljust(50, "-")
        @board_array
    end

    def value_of_card(pos)
        if pos == nil
            return nil
        else
            return @board_array[pos[0]][pos[1]].face_value
        end
    end

    def flip_down(pos)
        @board_array[pos[0]][pos[1]].face_up = false
    end

    def reveal(guessed_pos)
        @board_array[guessed_pos[0]][guessed_pos[1]].face_up = true
        return value_of_card(guessed_pos)
    end

    def is_already_revealed(pos)
        return !@board_array[pos[0]][pos[1]].face_down
    end

    def is_board_finished
        @board_array.each_with_index do |sub_array, idx|
            sub_array.each_with_index do |ele, ele_idx|
                if ele.face_down
                    return false
                end
            end
        end
        return true
    end

    def render(with_clear)
        puts `clear` if with_clear

        print "  "
        @size.times do |i|
            print i.to_s + " "
        end
        print "\n"

        @board_array.each_with_index do |sub_array, index|
            print index.to_s + " "
            sub_array.each do |card|
                print card.display + " "
            end
            print "\n"
        end
    end
end