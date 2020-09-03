class Towers
  attr_reader :disc0, :disc1, :disc2

  def initialize(size)
    @size = size
    @won_case = []
    @disc0 = []
    (1..size).each do |ele|
      disc0.unshift(ele)
      @won_case.unshift(ele)
    end
    @disc1 = []
    @disc2 = []
    play
  end

  def play
    while !won?
      render
      puts "Enter an input to move (eg:0 1)"
      user_input = gets.chomp
      split = user_input.split(" ")
      move(split[0].to_i, split[1].to_i)
    end
  end

  def render
    print "Rod0".ljust(10) + "Rod1".ljust(10) + "Rod2\n"
    @disc0.each do |disc0|
      print disc0
    end
    print " ".ljust(9)
    @disc1.each do |disc1|
      print disc1
    end
    print " ".ljust(8)
    @disc2.each do |disc2|
      print disc2
    end
    print "\n"
  end

  def disc_switch(from_disc)
    case from_disc
    when 0
      @disc0
    when 1
      @disc1
    when 2
      @disc2
    end
  end

  def move(from_disc, to_disc)
    disc_to_pull_from = disc_switch(from_disc)
    disc_to_send_to = disc_switch(to_disc)
    raise "This disc is larger then the rod you want to put it on." if disc_to_send_to.length != 0 && disc_to_pull_from.length != 0 && (disc_to_pull_from.last > disc_to_send_to.last)

    piece_to_move = disc_to_pull_from.pop
    disc_to_send_to << piece_to_move
  end

  private
  def won?
    return true if disc2 == @won_case
    return false
  end
end

towers = Towers.new(3)