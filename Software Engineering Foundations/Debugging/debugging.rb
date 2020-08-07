# Debugging with Pry

# As you develop and debug your programs, often times you'll find it useful to test ideas
# in a "sandbox" environment where you can get quick feedback on the state of your code.
# We'll use a Ruby REPL to this end. To review, REPL stands for Read, Evaluate, Print, Loop.

# pry
# ls String
# show-doc String#end_with?
# load "file.rb"

def is_prime?(num)
    (2...num).each do |factor|
        return false if num % factor == 0
    end
    num > 1
end

string = "hello"