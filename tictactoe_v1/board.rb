
class Board

    attr_reader :board

    def initialize()
        @board = Array.new(3) {Array.new(3, "_")}
    end

    def [](position)
        row, col = position
        board[row][col]
    end

    def []=(position, val)
        row, col = position
        board[row][col] = val
    end

    def valid?(position)
        row, col = position

        unless row > (board.length - 1) || col > (board.length - 1)
            return true
        end

        false
    end

    def empty?(position)
        # row, col = position

        unless self[position] != "_"
            return true
        end

        false
    end

    def place_mark(position, mark)
        # row, col = position
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
        Board.print_board(board)
    end

    def win_row?(mark)
        board.each do |sub|
            return true if sub.all?{|e| e == mark}
        end

        false
    end

    def win_col?(mark)
        board.transpose.each do |sub|
            return true if sub.all?{|e| e == mark}
        end

        false
    end

    def win_diagonal?(mark)
        diags = Hash.new(0)
        board.each_with_index do |row, col|
            diags[:for] += 1 if row[col] == mark
            diags[:back] += 1 if row[-col-1] == mark
        end
        diags.values.any?{|v| v == board.size}
    end

    def win?(mark)
        return true if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)

        false
    end

    def empty_positions?
        board.flatten.any?{|p| p == "_"}
    end

end