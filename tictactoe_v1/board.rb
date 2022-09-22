
class Board

    attr_reader :board

    def initialize()
        @board = Array.new(3) {Array.new(3, "_")}
    end

    def [](position)
        row, col = position
        @board[row][col]
    end

    def []=(position, val)
        row, col = position
        @board[row][col] = val
    end

    def valid?(position)
        row, col = position
        unless row > (@board.length - 1) || col > (@board.length - 1)
            return true
        end

        false
    end

    def empty?(position)
        row, col = position

        unless self[position] != "_"
            return true
        end

        false
    end

    def place_mark(position, mark)
        row, col = position
        unless self.empty?(position) && self.valid?(position)
            raise ArgumentError.new "Position out of bounds or occupied"
        end
        self[position] = mark
    end

    def self.print_board(matrix)
        matrix.each do |row|
            # print "|"
            row.each_with_index do |e, i|
                if i == (row.length - 1)
                    print "| #{e} |\n"
                else
                    print "| #{e} | "
                end
            end
            # print "|"
        end
    end

    def print
        Board.print_board(@board)
    end


end