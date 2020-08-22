require_relative "./board.rb"
require_relative "./human_player.rb"

class Game
    attr_reader :current_player
    def initialize(marks, size)
        @players = []
        marks.each do |mark|
            @players << HumanPlayer.new(mark)
        end
        #@player_one = Human_player.new(mark_one)
        #@player_two = Human_player.new(mark_two)
        @current_player = @players[0]
        @board = Board.new(size)
    end

    def switch_turn
        #@current_player = @current_player == @player_one ? @player_two : @player_one

        @players.each_with_index do |player, idx|
            if @current_player == player
                if idx == @players.length-1
                    @current_player = @players[0]
                    break
                else
                    @current_player = @players[idx+1]
                    break
                end
            end
        end
    end

    def play
        game_is_not_over = true
        while game_is_not_over
            @board.print_grid
            this_position = @current_player.get_position
            @board.place_mark(this_position, @current_player.my_mark)
            if @board.win?(@current_player.my_mark)
                puts "Victory! #{@current_player.my_mark} won!"
                game_is_not_over = false
                @board.print_grid
            else
                switch_turn
            end
            if !@board.empty_positions?
                game_is_not_over = false
                puts "It was a draw."
            end
        end
        puts "Game over."
    end
end

$game = Game.new([:X, :O, :V], 5)
$game.play