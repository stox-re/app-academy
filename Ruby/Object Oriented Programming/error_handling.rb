# Handling errors with recue
def main
    # run the main program in a loop
    while true
        # get an integer from the user
        puts "Please input a number"
        num = gets.to_i

        begin
            sqrt(num)
        rescue ArgumentError => e
            puts "Couldn't take the square root of #{num}"
            puts "Error was: #{e.message}"
        end
    end
end

def sqrt(num)
    unless num >= 0
        raise ArgumentError.new "Cannot take sqrt of negative number"
    end
    # code to calculate square root...
end

# Ensuring some code gets run during a rescue operation
begin
    a_dangerous_operation
rescue StandardError => e
    puts "Something went wrong: #{e.message}"
ensure
    puts "No matter what, make sure to execute this!"
end

# Retry to try again
def prompt_name
  puts "Please input a name:"
  # split name on spaces
  name_parts = gets.chomp.split

  if name_parts.count != 2
    raise "Uh-oh, finnicky parsing!"
  end

  name_parts
end

def echo_name
    begin
        fname, lname = prompt_name
        puts "Hello #{fname} of #{lname}"
    rescue RuntimeError => e
        puts "Please only use two names. ERR: " + e.message
        retry
    end
end

echo_name
# The retry keyword will cause Ruby to repeat the begin block from the beginning.
# It is useful for "looping" until an operation completes successfuly.

def slope(pos1, pos2)
    (pos2.y - pos1.y) / (pos2.x - pos1.x)
rescue ZeroDivisionError
    nil
end

# Exception hierarchy
# http://blog.nicksieger.com/articles/2006/09/06/rubys-exception-hierarchy/
# ArgumentError is when an argument is invalid being passed in
# RuntimeError is another go-to

# When creating an exception, you can add an error message so the user knows what went wrong:
# raise RuntimeError.new("Didn't try hard enough")

# If you want your user to be able to distinguish different failure types (perhaps to handle them differently),
# you can extend StandardError and write your own:
class EngineStalledError < StandardError
end

class CollisionOccurredError < StandardError
end

def drive_car
  # engine may stall, collision may occur
end

begin
    drive_car
rescue EngineStalledError => e
    puts "Rescued from engine stalled!"
rescue CollisionOccurredError => e
    puts "Rescued from collision!"
ensure
    puts "Car stopped."
end