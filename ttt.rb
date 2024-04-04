
    class Board
        def initialize 
            @board = Array.new(3) { Array.new(3) { "" }}
        end
        def update_cell(row, col, symbol)
            @board[row][col] = symbol unless full?
        end
        def full?
            @board.all? { |row| row.all? { |cell| cell != ""}}
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
            return move
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
        [[0,0], [1,1], [2,2]],
        [[0,2], [1,1], [2,0]],
        [[0,0], [1,0], [2,0]],
        [[0,2], [1,1], [2,1]],
        [[0,0], [1,2], [2,2]],
        [[1,0], [1,1], [1,2]],
        [[2,0], [2,1], [2,2]]
]
        def win_condition(psymbol)
            if @board.full?
                puts "It's a tie!" 
            else
                WIN_POSSIBILITIES.each do |poss|
                    if poss.all?  == psymbol 
                      puts "#{psymbol} wins!"
                      return
                end
            end
            false
        end
    end
end   
def play
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
    while true
        p1move = player1.your_turn(player1)
        game.player_move(player1, p1move, p1symbol)
        break if game.win_condition(p1symbol)

        p2move = player2.your_turn(player2)
        game.player_move(player2, p2move, p2symbol)
        break if game.win_condition(p2symbol)
    end
end

play()