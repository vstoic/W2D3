class Board

    attr_reader :size

    def initialize(n)
        @grid = Array.new(n){Array.new(n, :N)}
        @size = n * n
    end

    def [](pos)
        row, column = pos 
        @grid[row][column]
    end
    
    def []=(pos, value)
         row, column = pos 
        @grid[row][column] = value
    end

    def num_ships 
        @grid.flatten.count {|pos| pos == :S}
    end

    # Part 2 ----------------------------

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            p "you sunk my battleship!"
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        count = 0
        ship_count = @size * 0.25
        while count < ship_count
        row = rand(0...@grid.length)
        column = rand(0...@grid.length)
        pos = row, column
            if self[pos] != :S 
                self[pos] = :S
                count += 1 
            end
        end
    end

    def hidden_ships_grid
        hidden = @grid.map do |row|
            row.map do |column|
                if column == :S
                    column = :N
                else
                    column
                end
            end
        end
        hidden
    end

    def self.print_grid(grid)
        grid.each do |row| 
        puts row.join(" ")
        end
    end
    
    def cheat
        p Board.print_grid(@grid)
    end

    def print
        p Board.print_grid(self.hidden_ships_grid)
    end
end
