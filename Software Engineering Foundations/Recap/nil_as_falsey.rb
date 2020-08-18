# Nil is also false

# nil and false are the only falsey values
# Everything else is truthy


def is_true(val)
    if (val)
        p "Was true"
    else
        p "Was false"
    end
end
is_true(nil)

# || will return what is true if any available, and takes the first true element

p true || 42          # => true
p 42 || true          # => 42
p false || 42         # => 42
p 42 || false         # => 42
p false || "hello"    # => "hello"
p nil || "hello"      # => "hello"
p "hi" || "hello"     # => "hi"
p 0 || true           # => 0
p false || nil        # => nil

# Nil as default argument

# def greet(person = nil)
#     if person.nil?
#         person = "you"
#     end
#
#     p "Hey " + person
# end
def greet(person = nil)
    # person = person || "you"
    person ||= "you"
    p "Hey " + person
end

greet("Brian")  # => "Hey Brian"
greet           # => "Hey you"

# &prc automatically becomes nil if we don't pass a proc to it
def call_that_proc(val, &prc)
    prc ||= Proc.new { |data| data.upcase + "!!" }
    prc.call(val)
end

p call_that_proc("hey")                                             # => "HEY!!"
p call_that_proc("programmers") { |data| data * 3 }                 # => "programmersprogrammersprogrammers"
p call_that_proc("code") { |data| "--" + data.capitalize + "--"}    # => "--Code--"

class Restaurant
    attr_accessor :name, :chefs, :menu

    def initialize(name, chefs)
        @name = name
        @chefs = chefs
        # Instead of initializing menu here, if the array was huge, it's costly on resources.
        # Instead, lazy initialize it when the getter and @menu ||=, @menu = @menu || thing
    end

    def menu
        @menu ||= ["sammies", "big ol' cookies", "bean blankies", "chicky catch", "super water"]
    end
end

p five_star_restaurant = Restaurant.new("Appetizer Academy", ["Marta", "Jon", "Soon-Mi"])

p five_star_restaurant.menu