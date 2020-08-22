require_relative "./board.rb"
require_relative "./human_player.rb"
require_relative "./computer_player.rb"

class Game
    attr_reader :current_player
    def initialize(player_hash, size)
        @players = []
        player_hash.each do |key, value|
            if value
                @players << ComputerPlayer.new(key)
            else
                @players << HumanPlayer.new(key)
            end
        end
        @current_player = @players[0]
        @board = Board.new(size)
    end

    def switch_turn
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
            this_position = @current_player.get_position(@board.legal_positions)
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

# hash = {X: false, Y: true, Z: false}
hash = { X: false, O: true }
$game = Game.new(hash, 5)
$game.play