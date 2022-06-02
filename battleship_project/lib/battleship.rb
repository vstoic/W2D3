require_relative "board"
require_relative "player"

    
class Battleship
        
    attr_reader :board, :player

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
        puts "There are #{@board.num_ships} ships left :)"
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts "you lose"
            return true
        end
        false
    end

    def win?
        if @board.num_ships <= 0
            puts "you win"
            return true
        end
        false
    end

    def game_over?
        self.win? || self.lose?
    end

    def turn
        move = @player.get_move 
       if @board.attack(move) == true
            @board.attack(move)    
            @board.print
       else 
            @remaining_misses -= 1
            puts "#{@remaining_misses} remaining misses"
            @board.print
       end
    end





 

end
