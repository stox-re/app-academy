# Monkey patching
# Adding additional methods to existing classes
# Ruby types are classes, Integer, String, Array, Hash, etc...

class String
    def upcase?
        self.upcase == self
    end
end

p "hello".upcase?
p "HELLO".upcase?

class Integer
    def prime?
        return false if self < 2

        (2...self).each do |factor|
            if (self % factor == 0)
                return false
            end
        end
        true
    end
end

p 7.prime?
p 11.prime?
p 12.prime?

class Array
    def has_zero?
        self.include?(0)
    end
end

p [4,3,2,0,"hello"].has_zero? #true
