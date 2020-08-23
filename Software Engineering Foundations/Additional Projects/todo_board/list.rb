require_relative "./item.rb"

class List
    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description = "")
        return false if !Item.valid_date?(deadline)
        @items << Item.new(title, deadline, description)
        return true
    end

    def size
        @items.length
    end

    def valid_index?(index)
        return false if index < 0 || index > @items.length - 1
        return true
    end

    def swap(index_1, index_2)
        if valid_index?(index_1) && valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
        else
            return false
        end
    end

    def [](index)
        return nil if !valid_index?(index)
        return @items[index]
    end

    def priority
        return @items[0]
    end

    def print
        puts "--------------------------------------------------------------------"
        puts "                            Todo List                               "
        puts "--------------------------------------------------------------------"
        puts "Index  |  Item                         | Deadline     | Done        "
        puts "--------------------------------------------------------------------"
        @items.each_with_index do |item, idx|
            puts "#{(idx.to_s).ljust(6, " ")} | #{(item.title).ljust(29, " ")} | #{item.deadline}   | #{item.done}"
        end
        puts "--------------------------------------------------------------------\n"
    end

    def print_full_item(index)
        if valid_index?(index)
        puts "--------------------------------------------------------------------"
            puts "#{(@items[index].title).ljust(38, " ")} #{@items[index].deadline}"
            puts "#{@items[index].description}"
            puts "Done: #{@items[index].done}"
        puts "--------------------------------------------------------------------"
        end
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount = 1)
        if valid_index?(index)
            current_index = index
            amount.times do |i|
                return true if index == 0
                swap(current_index, current_index - 1)
                current_index -= 1
            end
            return true
        else
            return false
        end
    end

    def down(index, amount = 1)
        if valid_index?(index)
            current_index = index
            amount.times do |i|
                return true if index == @items.length - 1
                swap(current_index, current_index + 1)
                current_index += 1
            end
            return true
        else
            return false
        end
    end

    def sort_by_date!
        sorted = @items.sort_by! { |item| item.deadline }
        @items = sorted.reverse
    end

    def toggle_item(index)
        if valid_index?(index)
            @items[index].toggle
        end
    end

    def remove_item(index)
        if valid_index?(index)
            @items.delete_at(index)
            return true
        else
            return false
        end
    end

    def purge
        @items.reject! {|item| item.done }
    end
end