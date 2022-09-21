class Player
    def get_move
        
        puts "enter a position with coordinates separated witha space like '4 7'"

        move = gets.chomp.split.map!(&:to_i)
        move
    end
end
