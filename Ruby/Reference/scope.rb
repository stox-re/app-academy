# Scope

some_var = 'some value'

# ​The other types of variables mentioned have a special symbol at the beginning denoting them as such:​

# Instance variables begin with @
#@something = 2

#Class variables begin with @@
#@@class_variable = 5

def pow(base, exponent)
  i = 0
​
  while i < exponent
    result = result * base  # Error: result is being used before it has been defined.
​
    i += 1
  end
​
  result
end

(0...10).each do |ele|
    puts ele
end

p "Please give an input"
input = gets.chomp
puts `clear`
puts input.to_s + " Was the input"