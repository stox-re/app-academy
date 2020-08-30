class Board
  attr_accessor :cups
  NUM_OF_STARTING_STONES = 4

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, index|
      if index == 6 || index == 13
      else
        NUM_OF_STARTING_STONES.times do |i|
           @cups[index] << :stone
        end
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
    raise "Starting cup is empty" if @cups[start_pos].length == 0
  end

  def make_move(start_pos, current_player_name)
    @current_player = current_player_name
    this_cup = @cups[start_pos].dup
    @cups[start_pos] = Array.new
    new_cup_index = start_pos

    until this_cup.length == 0
      new_cup_index += 1
      new_cup_index = 0 if new_cup_index > 13

      if new_cup_index == 6
        @cups[new_cup_index] << this_cup.pop if current_player_name == @name1
      elsif new_cup_index == 13
        @cups[new_cup_index] << this_cup.pop if current_player_name == @name2
      else
        @cups[new_cup_index] << this_cup.pop
      end
    end

    render
    next_turn(new_cup_index)
  end

  def next_turn(ending_cup_idx)
    return :prompt if ending_cup_idx == 6
    return :prompt if ending_cup_idx == 13
    return :switch if @cups[ending_cup_idx].length == 1
    return ending_cup_idx
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    side1 = @cups[0..5].all? { |ele| ele.length == 0 }
    side2 = @cups[7..12].all? { |ele| ele.length == 0 }
    side1 || side2
  end

  def winner
    side1 = @cups[6].length
    side2 = @cups[13].length
    return :draw if side1 == side2
    return @name1 if side1 > side2
    return @name2 if side2 > side1
  end
end
