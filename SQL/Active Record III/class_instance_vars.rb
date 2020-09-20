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

# Wet versus dry with send

module Wet
  class Model
    def save
      # common code to save a model to a DB
    end
  end

  class Cat < Model
    def save
      super # call Model#save implementation

      puts "Cat saved!" # perform Cat-specific post-save logic
    end
  end

  class Dog < Model
    def save
      super # call Model#save implementation

      puts "Dog saved!" # perform Dog-specific post-save logic
    end
  end
end

module Dry
  class Model
    def self.save_callbacks
      @save_callbacks ||= []
    end

    # define a macro to *register* (record) a post-save *callback* (a
    # method to be called after another method completes)
    def self.save_callback(method_name)
      self.save_callbacks << method_name
    end

    def save
      # common code to save a model to a DB

      run_save_callbacks
    end

    private
    def run_save_callbacks
      self.class.save_callbacks.each do |method_name|
        # invoke the method named `method_name`
        send(method_name)
      end
    end
  end

  class Cat < Model
    save_callback :print_cat_saved

    private
    def print_cat_saved
      puts "Cat saved!" # perform Cat-specific post-save logic
    end
  end

  class Dog < Model
    save_callback :print_dog_saved

    private
    def print_dog_saved
      puts "Dog saved!" # perform Dog-specific post-save logic
    end
  end
end

# Wet versus Dry with macros

# Notice the redundant implementations of moo/bark/meow.
module Wet
  class Animal
  end

  class Cow < Animal
    def moo
      puts "moo!"
    end
  end

  class Dog < Animal
    def bark
      puts "bark!"
    end
  end

  class Cat < Animal
    def meow
      puts "meow!"
    end
  end
end

# Let's DRY it up!
module Dry
  class Animal
    private
    # define a `makes_noise` class method; a method that defines other
    # methods is called a *macro*
    def self.makes_noise(name)
      # When an Animal subclass calls `makes_noise`, we will
      # *dynamically* define a new method on the
      # subclass. `Class#define_method` is an instance method of the
      # `Class` class.
      define_method(name) do
        puts "#{name}!"
      end

      nil
    end
  end

  class Cow < Animal
    makes_noise :moo
  end

  class Dog < Animal
    makes_noise :bark
  end

  class Cat < Animal
    makes_noise :meow
  end
end