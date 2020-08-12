# Getting user input
p "Enter your name: "
name = gets
name = name.chomp
p "hello " + name

# Always end in \n.
# To remove the new line, use chomp. A string method to remove \n at the end of a string

# Gets always returns a string, so we need to convert between string and integers
p "Enter a number"
num = gets.chomp
p num.to_i * 2