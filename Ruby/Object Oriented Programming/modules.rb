# Ruby modules
# Like a class but you don't instantiate modules
# Consists of methods that can be mixed into a Class.
module Greetable
  def greet
    "Hello, my name is #{self.name}"
  end
end

# Include adds instance methods to a class
class Human
  include Greetable

  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end

class Robot
  include Greetable

  def name
    "Robot Model #2000"
  end
end

# Using 'extend' to add Class methods via a module.
module Findable
  def objects
    @objects ||= {}
  end

  def find(id)
    objects[id]
  end

  def track(id, object)
    objects[id] = object
  end
end

class Cat
  extend Findable

  def initialize(name)
    @name = name
    Cat.track(@name, self)
  end
end

Cat.new("Gizmo")
Cat.find("Gizmo") # finds Gizmo Cat object

# Ruby does not support multiple inheritances, only 1 parent class.
module Enumerable
  def map(&prc)
    results = []

    # notice how we need `each` to write `map`
    self.each { |el| results << prc.call(el) }

    results
  end

  ...
end

class Array < Object
  include Enumerable
  ...
end

class Hash < Object
  include Enumerable
  ...
end

# It doesn't normally make sense to put your application code inside a module,
# but if you want to make your code widely available as a gem, you would want to
# wrap it in a module so as to minimize potential conflicts.
