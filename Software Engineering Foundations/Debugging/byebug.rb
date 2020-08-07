# Using byebug
# require "byebug"
# add to the top of your file to gain access to the gem

# debugger
# place this line at a point in your file where you want to begin debugger mode

#while in debugger mode
# l <start line>-<end line> - list the line numbers in the specified range
# example: l 3-20
# step or s - step into the method call on the current line, if possible
# next or n - move to the next line of executed code
# break <line num> or b <line num> - place a breakpoint at the specified line number, this will pause execution again
# continue or c - resume normal execution of the code until a breakpoint
# display <variable> - automatically show the current value of a variable

# code.rb
require "byebug"

def is_prime?(number)
  (2...number).each do |factor|
    return false if number % factor == 0
  end
  number > 1
end

def first_n_primes(num_primes)
  primes = []
  num = 2
  debugger
  while primes.length < num_primes
    primes << num if is_prime?(num)
    num += 1
  end
  primes
end

p first_n_primes(11)