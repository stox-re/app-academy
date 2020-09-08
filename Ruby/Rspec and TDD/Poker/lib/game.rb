require_relative "./deck.rb"
require_relative "./player.rb"

class Game
  def initialize(size)
    @deck = Deck.new
    @players = []
    (0...size).each do |i|
      @players << Player.new(@deck.deal)
    end
    @current_player_index = 0
    @game_over = false
    render
  end

  def switch_turns
    if @current_player_index == @players.length - 1
      @current_player_index = 0
    else
      @current_player_index += 1
    end
  end

  def render
    puts `clear`
    while !@game_over
      p "Player #{@current_player_index} turn:"
      @players[@current_player_index].show_hand
      result = @players[@current_player_index].take_turn
      if result != "H"
        @deck.add_to_discards(result)
      end
    end
  end
end

game = Game.new(2)