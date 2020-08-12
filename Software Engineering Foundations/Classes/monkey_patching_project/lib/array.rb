# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.length == 0
        self.max - self.min
    end
    def average
        return nil if self.length == 0
        average = self.inject(0.0){ |sum, el| sum + el } / self.length
        average
    end
    def median
        return nil if self.length == 0
        sorted = self.sort
        if self.length % 2 == 0
            return (sorted[sorted.length/2-1] + sorted[sorted.length/2]) / 2.0
        else
            return sorted[sorted.length/2]
        end
    end
    def counts
        hash = Hash.new(0)
        self.each do |item|
            hash[item] += 1
        end
        hash
    end
    def my_count(value)
        count = 0
        self.each do |item|
            if value == item
                count += 1
            end
        end
        count
    end
    def my_index(value)
        self.each_with_index do |item, idx|
            if value == item
                return idx
            end
        end
        nil
    end
    def my_uniq
        found = false
        new_array = []
        self.each do |item|
            if !new_array.include?(item)
                new_array << item
            end
        end
        new_array
    end
    def my_transpose
        new_array = []
        self.length.times do
            new_array.push([])
        end
        self.each_with_index do |num, idx|
            self[idx].each_with_index do |num_inside, idx_inside|
                new_array[idx_inside].push(num_inside)
            end
        end
        new_array
    end
end
