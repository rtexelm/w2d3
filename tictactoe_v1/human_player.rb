class HumanPlayer
    
    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position
        nums = (0..99).map(&:to_s)

        print "Enter position [row, column] to mark with #{mark_value} as two numbers separated by a space like '0 1':> "

        position = gets.chomp.split

        if !position.all?{|c| nums.include?(c)} || position.size != 2
            raise "Position is invalid, make sure it is two numbers only separated by a space"
        end

        position.map!(&:to_i)
    end



end