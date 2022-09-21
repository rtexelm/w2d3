require_relative "board"
require_relative "player"

class Battleship
    
    attr_reader :player, :board, :remaining_misses

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = board.size / 2
    end

    def start_game
        board.place_random_ships
        puts "\nShips on board : #{board.num_ships}\n\n"
        board.print
    end

    def lose?
        unless remaining_misses <= 0
            return false
        end

        puts "you lose"
        true
    end

    def win?
        unless board.num_ships <= 0
            return false
        end

        puts "you win"
        true
    end

    def game_over?
        win? || lose?
    end

    def turn
        move = player.get_move
        if !board.attack(move)
            @remaining_misses -= 1
        end
        board.print
        puts "\nRemaining misses: #{@remaining_misses}"
    end

end
