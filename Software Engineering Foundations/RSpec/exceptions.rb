# Exceptions in ruby
def my_method(arg_1, arg_2)
    puts arg_1
    puts arg_2
  end

# my_method("a") # ArgumentError: wrong number of arguments (given 1, expected 2)

#num = 0

#10 / num # ZeroDivisionError: divided by 0

#puts "finished"

# Handling exceptions more gracefully then terminating the program
num = 0
begin
  puts "dividing 10 by #{num}"
  ans = 10 / num
  puts "the answer is #{ans}"
rescue
  puts "There was an error with that division."
end
puts "--------"
puts "finished"

# def format_name(first, last)
#    first.capitalize + " " + last.capitalize
#end

#format_name("grace", "HOPPER") # => "Grace Hopper"
# format_name(42, true) # => NoMethodError: undefined method `capitalize' for 42:Integer
# OR
# format_name(42, true) # => RuntimeError: arguments must be strings

# Check if string
p "hello".instance_of?(String)  # => true
p 42.instance_of?(String)       # => false

def format_name(first, last)
    if !(first.instance_of?(String) && last.instance_of?(String))
      raise "arguments must be strings"
    end
    first.capitalize + " " + last.capitalize
end

format_name("grace", "hopper") # => "Grace Hopper"
#format_name(42, true)          # => RuntimeError: arguments must be strings

first_name = 42
last_name = true
begin
  puts format_name(first_name, last_name)
rescue
  # do stuff to rescue the "arguments must be strings" exception...
  puts "there was an exception :("
end


# Raise is how we bring up a custom exception
# begin...rescue is how we react to an exception
