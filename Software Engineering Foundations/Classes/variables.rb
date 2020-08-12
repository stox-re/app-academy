# Instance vs. Class Variabes
# Instance variable @color gives a color variable for each Car object that gets made.
# If we want all cars to have a common variables, we need a class variable @@num_wheels
class Car
    @@num_wheels = 4
    def initialize(color)
      @color = color
    end

    def color
      @color
    end
    # getter for @@num_wheels class variable
    def num_wheels
        @@num_wheels
    end

    #Invoking: Car.upgrade_to_flying_cars would change the num_wheels for all instances of Car type.
    # As a result of all instances sharing @num_wheels, any change will affect all instances.
    #def self.upgrade_to_flying_cars
    #    @@num_wheels = 0
    #end

end

car_1 = Car.new("red")
p car_1.color     # "red"

car_2 = Car.new("black")
p car_2.color     # "black"

p car_2.num_wheels


# Instead we use Class Constants

class Car
    NUM_WHEELS = 4

    def self.upgrade_to_flying_cars
      NUM_WHEELS = 0    # SyntaxError: dynamic constant assignment
    end

    def initialize(color)
      @color = color
    end

    def num_wheels
      NUM_WHEELS
    end
  end


  car_1 = Car.new("red")
  car_2 = Car.new("black")

  p car_1.num_wheels    # 4
  p car_2.num_wheels    # 4

  Car.upgrade_to_flying_cars

# Overview
# an @instance_variable will be a distinct variable in each instance of a class;
# changing the variable will only effect that one instance
# a @@class_variable will be shared among all instances of a class;
# changing the variable will effect all instances because all instances of the class
# a CLASS_CONSTANT will be shared among all instances of a class, but cannot be changed
