# To get a method to accept any number of parameters, use splat.
# It will gather them into an array

def method(arg_1, arg_2, *other_args)
    p arg_1         # "a"
    p arg_2         # "b"
    p other_args    # ["c", "d", "e"]
end
method("a", "b", "c", "d", "e")


# Passing in only the 2 required params
def method2(arg_1, arg_2, *other_args)
    p arg_1         # "a"
    p arg_2         # "b"
    p other_args    # []
end
method2("a", "b")

# Using splat to decompose an array into the arguments
def greet(first_name, last_name)
    p "Hey " + first_name + ", your last name is " + last_name
end

names = ["Grace", "Hopper"]
greet(*names)    # => "Hey Grace, your last name is Hopper"

# Another example of using splat with arrays
arr_1 = ["a", "b"]
arr_2 = ["d", "e"]
arr_3 = [ *arr_1, "c", *arr_2 ]
p arr_3 # => ["a", "b", "c", "d", "e"]

# Using splat with a hash, but only when the keys are symbols
old_hash = { a: 1, b: 2 }
new_hash = { **old_hash, c: 3 }
p new_hash # => {:a=>1, :b=>2, :c=>3}