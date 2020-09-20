# Class Instance Variables
class Dog
  def self.all
    @dogs ||= []
  end

  def initialize(name)
    @name = name

    self.class.all << self
  end
end

d1 = Dog.new("Fido")
d2 = Dog.new("Fido 2.0")

p Dog.all
# => [#<Dog:0x007fe140a23928 @name="Fido">,
 #<Dog:0x007fe140a628d0 @name="Fido 2.0">]

 # If we make a corgi inheriting dogs
class Corgi < Dog
end
# It wont be added to the @dogs array, because that is a class instance variable
# To do so, we need to make @dogs a Class variable

class Dog
  def self.all
    @@dogs ||= []
  end

  def initialize(name)
    @name = name

    self.class.all << self
  end
end

class Husky < Dog
end

h = Husky.new("Rex")

Dog.all # => #<Husky:0x007f95421b5560 @name="Rex">

# Most of the classes you write won't be inherited from.
# So you may want to eject the emotional baggage of @@ and just
# stick with the @ variables you are familiar with, at least until @ doesn't work.

# Puts and gets are using $stdin and $stdout
def puts(*args)
  $stdout.puts(*args)
end

def gets(*args)
  $stdin.gets(*args)
end