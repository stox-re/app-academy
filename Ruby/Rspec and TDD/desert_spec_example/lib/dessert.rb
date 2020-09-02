class Dessert
  attr_reader :type, :amount
  def initialize(type, amount)
    @amount = amount
    @type = amount > 100 ? "giant #{type}" : type
  end
end