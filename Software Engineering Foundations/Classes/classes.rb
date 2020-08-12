# Classes
# Initializing a new Cat object via .new and initialize.
# Getters to get attributes, and setters to set them

class Cat

    def initialize(name, color, age)
        @name, @color, @age = name, color, age
    end

    # Getters
    def name
        @name
    end
    def age
        @age
    end
    def color
        @color
    end

    # Setters
    def age=(number)
        @age = number
    end

    # Some methods
    def purr
        if @age > 5
            puts @name.upcase + " goes purrrrrr..."
        else
            puts "..."
        end
    end
    def meow_at(person)
        puts "#{@name} meows at #{person}"
    end
end
# @ is how we denote a instance variable or attribute of the class.

cat_1 = Cat.new("Sennacy", "brown", 3)
cat_2 = Cat.new("Whiskers", "white", 5)
# When calling .new, it actually calls the 'initialize' method inside the class

cat_1.age = 20
cat_1.purr

cat_1.meow_at("Michael")