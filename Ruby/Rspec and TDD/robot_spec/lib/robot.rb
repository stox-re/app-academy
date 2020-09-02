class Robot
  attr_reader :position

  def initialize()
    @position = [0,0]
    @items = []
    @health = 100
    @equipped_weapon = nil
  end

  def move_left
    @position[0] -= 1
  end

  def move_right
    @position[0] += 1
  end

  def move_up
    @position[1] += 1
  end

  def move_down
    @position[1] -= 1
  end

  def items
    return @items
  end

  def pick_up(item)
    raise ArgumentError if items_weight + item.weight > 250
    @items << item
  end

  def items_weight
    sum = 0
    @items.each do |item|
      sum += item.weight
    end
    sum
  end

  def health
    return @health
  end

  def wound(amount)
    if (@health - amount) <= 0
      @health = 0
    else
      @health -= amount
    end
  end

  def heal(amount)
    if @health + amount >= 100
      health = 100
    else
      @health += amount
    end
  end

  def attack(other_robot)
    if @equipped_weapon != nil
      @equipped_weapon.hit(other_robot)
    else
      other_robot.wound(5)
    end
  end

  def equipped_weapon
    @equipped_weapon
  end

  def equipped_weapon=(weapon)
    @equipped_weapon = weapon
  end

end

class Item
  attr_reader :name, :weight

  def initialize(name, weight)
    @name = name
    @weight = weight
  end
end

class Bolts < Item
  def initialize
    super("bolts", 25)
  end

  def feed(robot)
    robot.heal(25)
  end
end

class Weapon < Item
  attr_reader :damage

  def initialize(name, weight, damage)
    @damage = damage
    super(name, weight)
  end

  def hit(robot)
    robot.wound(@damage)
  end
end

class Laser < Weapon
  def initialize
    super("laser", 125, 25)
  end
end

class PlasmaCannon < Weapon
  def initialize
    super("plasma_cannon", 200, 55)
  end
end