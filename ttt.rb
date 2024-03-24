
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

    def your_turn(name)
        puts "it's your turn to play #{name}! What's your move?"
        move = gets.chomp


 
