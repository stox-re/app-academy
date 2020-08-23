class Array
    def my_each(&prc)
        for i in 0...self.length do
            prc.call(self[i])
        end
        return self
    end

    def my_select(&prc)
        new_array = []
        self.my_each do |ele|
            new_array << ele if prc.call(ele)
        end
        new_array
    end

    def my_reject(&prc)
        new_array = []
        self.my_each do |ele|
            if !prc.call(ele)
                new_array << ele
            end
        end
        new_array
    end

    def my_any?(&prc)
        was_found = false
        self.my_each do |ele|
            if prc.call(ele)
                was_found = true
            end
        end
        was_found
    end

    def my_all?(&prc)
        was_found = true
        self.my_each do |ele|
            if !prc.call(ele)
                was_found = false
            end
        end
        was_found
    end

    def my_flatten
        new_array = []
        self.each do |element|
            if element.is_a?(Array)
                new_array += element.my_flatten # concatenates the other array
            else
                new_array << element
            end
        end
        new_array
    end

    def my_zip(*args)
        new_array = []
        self.length.times do |sub|
           new_array.push(Array.new())
        end

        self.each_with_index do |item, idx|
            new_array[idx] << item
            args.each_with_index do |arg, arg_idx|
                arg.each_with_index do |ele, ele_idx|
                    if idx == ele_idx
                        new_array[idx] << ele
                    end
                end
            end
            while new_array[idx].length < self.length
                new_array[idx] << nil
            end
        end

        new_array
    end

    def my_rotate(num = 1)
        rotated = self.dup

        if num < 0
            (num * -1).times do
                element_popped = rotated.pop
                rotated.unshift(element_popped)
            end
        else
            num.times do
                rotated.push(rotated.shift)
            end
        end
        rotated
    end

    def my_join(seperator = "")
        string = ""
        self.each_with_index do |ele, idx|
            if idx != self.length - 1
                string += ele + seperator
            else
                string += ele
            end
        end
        string
    end

    def my_reverse
        new_array = []
        for i in (self.length - 1).downto(0)
            new_array << self[i]
        end
        new_array
    end
end

puts "---my_each---"
return_value = [1, 2, 3].my_each do |num|
  puts num
end.my_each do |num|
  puts num
end
# => 1
#    2
#    3
#    1
#    2
#    3
p return_value  # => [1, 2, 3]
puts "\n---my_select---"
a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []

puts "\n---my_reject---"
a = [1, 2, 3]
p a.my_reject { |num| num > 1 } # => [1]
p a.my_reject { |num| num == 4 } # => [1, 2, 3]

puts "\n---my_any? and my_all?---"
a = [1, 2, 3]
p a.my_any? { |num| num > 1 } # => true
p a.my_any? { |num| num == 4 } # => false
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true

puts "\n---my_flatten---"
p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

puts "\n---my_zip---"
a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]

puts "\n---my_rotate---"
a = [ "a", "b", "c", "d" ]
p a.my_rotate         #=> ["b", "c", "d", "a"]
p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

puts "\n---my_join---"
a = [ "a", "b", "c", "d" ]
p a.my_join         # => "abcd"
p a.my_join("$")    # => "a$b$c$d"

puts "\n---my_reverse---"
p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]