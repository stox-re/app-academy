# Spaceship operator <=>

# The spaceship operator <=> is used between two values and will return -1, 0, or 1. The behavior is as follows:

# given the expression a <=> b
# it will return -1 if a is less than b
# it will return 0 if a is equal to b
# it will return 1 if a is greater than b

p 7 <=> 2     # => 1
p 7 <=> 7     # => 0
p 2 <=> 7     # => -1
p 10 <=> 2    # => 1
p -5 <=> 10   # => -1
p -3 <=> -9   # => 1