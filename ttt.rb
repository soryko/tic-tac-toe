
class Board
    def initialize 
        @board = Array.new(3) { Array.new(3) { "" }}
    end
    def update_cell(row, col, symbol)
        @board[row][col] = symbol
    end
    def sequence
        @board.each do |row|
            puts row.join('|')
        end
        puts '-' * (@board.size*2-1)
    end
end

class Player
    def initialize(name)
        @name = name
    end

    def turns
        puts "Do you want to go X or O?(X/O)"
        answer = gets.chomp
        if answer.downcase == "x"
            return @symbol = "X"
        elsif answer.downcase == "o"
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

    def player_move(player, move, symbol)
        row, col = convert_move_to_index(move)
        @board.update_cell(row, col, symbol)
        @board.sequence
    end

    def convert_move_to_index(move)
        row_char = move[0].upcase
        col_num = move[1].to_i - 1
        return [row_char.ord - 65, col_num]
    end
    WIN_POSSIBILITIES = [
        [@a1, @a3, @a5],
        [@b1, @b3, @b5],
        [@c1, @c3, @c5],
        [@a1, @b1, @c1],
        [@a3, @b3, @c3],
        [@a5, @b5, @c5],
        [@a1, @b3, @c5],
        [@a5, @b3, @c1]
    ]

    def win_condition
        WIN_POSSIBILITIES.each do |poss|
            return true if poss.all? { |cell| cell == 'X' || cell == 'O'}
        end
        false
    end
end

board = Board.new
puts "please enter player1 name: "
player1 = gets.chomp
player1 = Player.new(player1)
puts "please enter player2 name: "
player2 = gets.chomp
player2 = Player.new(player2)
p1symbol = player1.turns
if p1symbol == "O"
    p2symbol = "X"  
else
    p2symbol = "O"
end
game = Game.new(board, player1, player2)
until game.win_condition == true
    p1move = player1.your_turn(player1)
    game.player_move(player1, p1move, p1symbol)
    p2move = player2.your_turn(player2)
    game.player_move(player2, p2move, p2symbol)
    game.win_condition
end