# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError => e
    puts "Couldn't conver to Integer of #{str}"
    puts "Error was: #{e.message}"
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    raise StandardError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp

  begin
    reaction(maybe_fruit)
  rescue StandardError => e
    puts "Couldn't get reaction to fruit #{maybe_fruit}"
    puts "Error was: #{e.message}"
    if maybe_fruit == "coffee"
      feed_me_a_fruit
    end
  end
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise "Name is too short" if name.length <= 0
    raise "Pasttime is too short" if fav_pastime.length <= 0
    raise "You're not best friends if you haven't known them for less than 5 years" if yrs_known < 5
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end


