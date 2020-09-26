# require 'bcrypt'
BCrypt::Password.create("something")
pass.class
db_pass = pass.to_s

bcrypt_pass = BCrypt::Password(db_pass) # Back into a bcrypt object

# Methods: .checksum, .salt, .cost
bcrypt_pass.is_password?("something") # true
