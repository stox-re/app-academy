# Procs
# Proc is an object that holds a block
# Allows saving blocks to variables

doubler = Proc.new { |num| num * 2 }
p doubler # #<Proc:0x00007f9a8b36b0c8>
p doubler.call(5) # => 10
p doubler.call(7) # => 14

is_even = Proc.new do |num|
    if num % 2 == 0
      true
    else
      false
    end
  end

  p is_even.call(12) # => true

  # Passing procs to methods
  def add_and_proc(num_1, num_2, prc)
    sum = num_1 + num_2
    p prc.call(sum)
  end

  doubler = Proc.new { |num| num * 2 }
  add_and_proc(1, 4, doubler)   # => 10

  square = Proc.new { |num| num * num }
  add_and_proc(3, 6, square)    # => 81

  negate = Proc.new { |num| -1 * num }
  add_and_proc(3, 6, negate)    # => -9

  # Automatically convert a block into a proc when passing into a method as a parameter
  # Version 1: manual, proc accepting method
def add_and_proc(num_1, num_2, prc)
    sum = num_1 + num_2
    p prc.call(sum)
end

doubler = Proc.new { |num| num * 2 }
add_and_proc(1, 4, doubler)   # => 10

# Version 2: automatic conversion from block to proc
def add_and_proc(num_1, num_2, &prc)
    sum = num_1 + num_2
    p prc.call(sum)
end

add_and_proc(1, 4) { |num| num * 2 }  # => 10


# Error
# Because &proc is converting a block into a proc, but we are passing an actual proc.
def add_and_proc(num_1, num_2, &prc)
    sum = num_1 + num_2
    p prc.call(sum)
end

doubler = Proc.new { |num| num * 2 }
add_and_proc(1, 4, doubler)   # Error

# Using & again to conver the proc back into a block to be passed to a converting &prc parameter.
def add_and_proc(num_1, num_2, &prc)
    sum = num_1 + num_2
    p prc.call(sum)
  end

doubler = Proc.new { |num| num * 2 }
add_and_proc(1, 4, &doubler)   # => 10

# Example of using map with procs
[1,2,3].map { |num| num * 2 } # => [2, 4, 6]

doubler = Proc.new { |num| num * 2 }
[1,2,3].map(&doubler) # => [2, 4, 6]