
class Board
    def initialize 
        @a1 = ""
        @a2 = "|"
        @a3 = ""
        @a4 = "|"
        @a5 = ""
        
        @ab = "------------------"

        @b1 = ""
        @b2 = "|"
        @b3 = ""
        @b4 = "|"
        @b5 = ""

        @bc = "------------------"
        
        @c1 = ""
        @c2 = "|"
        @c3 = ""
        @c4 = "|"
        @c5 = ""
    end

    def sequence
        l1 = [@a1, @a2, @a3, @a4, @a5]
        l2 = [@ab]
        l3 = [@b1, @b2, @b3, @b4, @b5]
        l4 = [@bc]
        l5 = [@c1, @c2, @c3, @c4, @c5]
        puts "#{l1}\n#{l2}\n#{l3}\n#{l4}\n#{l5}"
    end
end

class Player
    def initialize(name)
        @name = name
    end

    def turns
        puts "Do you want to go first or second?(first/second)"
        answer = gets.chomp
        if answer == "first"
            return @symbol = "X"
        elsif answer == "second"
            return @symbol == "O"
        else
            puts "invalid entry, please try again"
            turns()
        end
    end
    def your_turn(name)
        puts "it's your turn to play #{name}! What's your move?"
        move = gets.chomp
    end
end

class Game
    def initialize(board, player1, player2)
        @board = board
        @player1 = player1
        @player2 = player2
    end

    def player_move(player, move)
        board.move = move
        new_board = board.sequence
        puts new_board
        win_condition(player.symbol)
    end

    def win_condition(symbol)
        if @a1 == @a3 == @a5 == symbol
            puts "congratulations #{symbol} won"
            return @win = true
        if @b1 == @b3 == @b5 == symbol
            puts "congratulations #{symbol} won"
            return @win = true
        if @c1 == @c3 == @c5 == symbol
            puts "congratulations #{symbol} won"
            return @win = true
        if @a1 == @b1 == @c1 == symbol
            puts "congratulations #{symbol} won"
            return @win = true
        if @a3 == @b3 == @c3 == symbol
            puts "congratulations #{symbol} won"
            return @win = true
        if @a5 == @b5 == @c5 == symbol
            puts "congratulations #{symbol} won"
            return @win = true
        if @a1 == @b3 == @c5 == symbol
            puts "congratulations #{symbol} won"
            return @win = true
        if @a5 == @b3 == @c1 == symbol
            puts "congratulations #{symbol} won"
            return @win = true
        else
            @win = false
        end
    end
end