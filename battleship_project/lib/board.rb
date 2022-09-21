require "byebug"

class Board

    attr_reader :size
    # attr_accessor :[]

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def [](position)
        row, col = position 
        @grid[row][col]
    end

    def []=(position, val)
        row, col = position
        @grid[row][col] = val
    end

    def num_ships
        # @grid.flatten.count(== :S) why not???
        @grid.flatten.count(:S)
        # why not @grid.flatten.count(&:eql?(:S))?
    end

    def attack(position)
        # row, col = position
        unless self[position] == :S
            self[position] = :X
            return false
        end
        self[position] = :H
        puts "you sunk my battleship!"
        true
    end

    def place_random_ships
        # debugger
        ship_count = self.size / 4
        ship_count.times do

            row, col = rand(@grid.length), rand(@grid.length)

            while self[[row, col]] == :S
                row, col = rand(@grid.length), rand(@grid.length)
            end

            random_coords = [row, col]
            self[random_coords] = :S
        end

        # puts self.num_ships
    end

    def hidden_ships_grid

        hidden = @grid.map.with_index do |sub, row|
            @grid.map.with_index do |ele, col|
                if self[[row, col]] == :S
                    :N
                else
                    self[[row, col]]
                end
            end
        end
        
    end

    def self.print_grid(grid)

        grid.each do |row|
            # print "| "
            row.each_with_index do |e, i| 
                if i == row.size - 1
                    print "#{e}\n"
                else
                    print "#{e} "
                end
            end
        end

    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

end
