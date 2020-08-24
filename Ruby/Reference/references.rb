# References
x = 4
y = x
x += 2
p y
# y is still 4, because these are immutable objects

# Strings and arrays are mutable
x = "donatello"
y = x
x << " the mutant ninja turtle"
p y

x = "donatello"
y = x
x += " the mutant ninja turtle"
p y

# When using +=, it is immutable, so it creates a new place in memory for the result, versus <<

x = []
y = x
x << 2
p y

# << is mutable, so the place in memory of the array gets added on with 2.

x = Array.new(3, [])
x[0] << "Hello"
p x
# The [] used in Array.new() is the same empty array, so it gets "Hello" 3 times.

x = Array.new(3) { [] }
y = x
x[0] << "hello"
p y

my_object = Object.new
# my_object now refers to a new instance of Object

my_object = Object.new
# a new Object instance is created, and the my_object variable is
# reassigned so that it now refers to this object, rather than the old
# object.

# call `my_method` on the object that `my_object` refers to

#my_object.my_method

# One point is that = does not mutate (modify) an object;
# it merely reassigns the variable so that it now refers to a new object.

def add_to_array!(array, item)
  array << item
end

my_array = []
add_to_array!(my_array, "an item!")
p my_array

x += y # => x = x + y, will work as long as `#+` is defined
x != y # => !(x == y), will use the `#==` method

# true || this_code_is_not_run
# false || this_code_will_be_run

(1 || 2) == 1
(nil || 5) == 5

class MemoizedFibonacci
  def initialize
    @values = {}
  end

  def fib(n)
    @values[n] ||= calculate_fib(n)
    # expands to:
    #     @values[n] = @values[n] || calculate_fib(n)
    # if @values[n] is nil (not previously computed), will call
    # `calculate_fib` and store the result for later reference.
  end

  private
  def calculate_fib(n)
    case n
        when 0
                0
        when 1
                1
        else
            fib(n - 1) + fib(n - 2)
        end
    end
end

arr_of_arrs = Array.new(3) { Array.new }
# OR
arr_of_arrs = Array.new(3) { [] }

arr_of_arrs[0] << "a"
p arr_of_arrs

hash = Hash.new([])
# This makes only 1 array that things point to as keys
hash = Hash.new() { [] }
# This also fails to do it
p hash["Devon"] << "Breakfast"
p hash["George"]
p hash.keys

cats = Hash.new { |h, k| h[k] = [] }
cats["Devon"]
cats["John"] << "Kiki"
p cats