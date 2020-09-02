class Sloth
  attr_reader :name, :foods, :drinks
  DIRECTIONS = ["north", "south", "east", "west"]

  def initialize(name)
    @name = name
    @foods = []
    @drinks = {}
  end

  def eat(food)
    @foods << food
  end

  def drink(drink, value)
    @drinks[drink] = value
  end

  def run(direction)
    raise ArgumentError unless DIRECTIONS.include?(direction)
    return "The direction is #{direction}"
  end

  protected
  def secret_sloth
    "This is a secret..."
  end
end