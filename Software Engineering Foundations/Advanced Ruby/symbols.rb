# Symbols versus Strings

str = "hello"   # the string
sym = :hello    # the symbol

p str.length    # => 5
p sym.length    # => 5

p str[1]        # => "e"
p sym[1]        # => "e"

p str == sym    # => false
# a string is different from a symbol!

# Symbols are immutable!
str = "hello"
sym = :hello

str[0] = "x"
sym[0] = "x"

p str   # => "xello"
p sym   # => :hello

# Symbols can never change
"hello".object_id   # => 70233443667980
"hello".object_id   # => 70233443606440
"hello".object_id   # => 70233443438700

:hello.object_id    # => 2899228
:hello.object_id    # => 2899228
:hello.object_id    # => 2899228

# Use symbols as hash keys instead of strings

my_bootcamp = { :name=>"App Academy", :color=>"red", :locations=>["NY", "SF", "ONLINE"] }
p my_bootcamp           # => {:name=>"App Academy", :color=>"red", :locations=>["NY", "SF", "ONLINE"]}
p my_bootcamp[:color]   #=> "red

# Can also be declared with colons instead of =>

my_bootcamp = { name:"App Academy", color:"red", locations:["NY", "SF", "ONLINE"] }
p my_bootcamp           # => {:name=>"App Academy", :color=>"red", :locations=>["NY", "SF", "ONLINE"]}
p my_bootcamp[:color]   #=> "red

