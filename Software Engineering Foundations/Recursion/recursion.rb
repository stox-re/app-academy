# Recursion
# When a method calls itself

def count_down(num)
  if num == 0
    p "Houston, we have lift-off!"
    return;
  end

  p num
  count_down(num - 1)
end

count_down(10)

# A recursive method consists of two fundamental parts:

# the base case where we halt the recursion by not making a further call
# the recursive step where we continue the recursion by making another subsequent call

def factorial(n)
  return 1 if n == 1
  n * factorial(n - 1);
end

factorial(5) # => 120

def fib(n)
  return 1 if n == 1 || n == 2
  fib(n - 1) + fib(n - 2)
end

fib(5)