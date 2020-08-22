require_relative "./board.rb"
require_relative "./human_player.rb"

class Game
    attr_reader :current_player
    def initialize(mark_one, mark_two)
        @player_one = HumanPlayer.new(mark_one)
        @player_two = HumanPlayer.new(mark_two)
        @current_player = @player_one
        @board = Board.new(3)
    end

    def switch_turn
        @current_player = @current_player == @player_one ? @player_two : @player_one
    end

    def play
        game_is_not_over = false
        while @board.empty_positions? || game_is_not_over
            @board.print_grid
            this_position = @current_player.get_position
            @board.place_mark(this_position, @current_player.my_mark)
            if @board.win?(@current_player.my_mark)
                puts "Victory! #{@current_player.my_mark} won!"
                game_is_not_over = true
                @board.print_grid
            else
                switch_turn
            end
        end
        if !@board.empty_positions?
            puts "It was a draw."
        end
        puts "Game over."
    end
end

$game = Game.new(:X, :O)
$game.play