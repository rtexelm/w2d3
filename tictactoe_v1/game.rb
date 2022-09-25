require_relative 'board'
require_relative 'human_player'

class Game

    attr_reader :current_player, :board

    def initialize(player_1_mark, player_2_mark)
        @player1 = HumanPlayer.new(player_1_mark)
        @player2 = HumanPlayer.new(player_2_mark)
        @board = Board.new
        @current_player = @player1
    end

    def switch_turn
        if @current_player == @player1
            @current_player = @player2
        else
            @current_player = @player1
        end
    end

    def play
        while board.empty_positions?
            board.print
            position = current_player.get_position
            mark = current_player.mark_value
            board.place_mark(position, mark)
            return puts "#{mark} wins!" if board.win?(mark)
            
            self.switch_turn
        end

        board.print
        return puts "\nDRAW!"
    end

end