# Setting global variable

$message = "hello"

def say_hello
    p $message
end

say_hello # => "hello globe"

# Constants
FOOD = "pho"
p FOOD # => "pho"

#FOOD = "ramen"  #warning: already initialized constant FOOD
                #warning: previous definition of FOOD was here
FOOD[0] = "P"
p FOOD # => "Pho
# Constants can't be reassigned but they can be modified.

$drink = "ice coffee"

def my_favorite
    p FOOD
    p $drink
end

my_favorite