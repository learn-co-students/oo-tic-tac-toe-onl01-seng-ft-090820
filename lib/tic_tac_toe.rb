require 'pry'

class TicTacToe

    attr_accessor :board

    def initialize
        @board = Array.new(9, " ")
    end

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]

    def display_board 

        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
        
    end

    #Define a method into which we can pass user input (in the form of a string, e.g., "1", "5", etc.) and have it return to us the corresponding index of the @board array. Remember that, from the player's point of view, the board contains spaces 1-9. But the indices in an array start their count at 0. If the user inputs 5, your method must correctly translate that from the player's perspective to the array's — accounting for the fact that @board[5] is not where the user intended to place their token.

    def input_to_index(input)

        #the input is the spot on the board they want
        #change their string to an integer
        i = input.to_i - 1
        return i
        #change their integer to the position they really mean (-1)

    end

    #move

    #Your #move method must take in two arguments: the index in the @board array that the player chooses and the player's token (either "X" or "O"). The second argument, the player's token, should default to "X".

    def move(i, token = "X")

        #set the position of the board at the index of their choice (i) equal to token
        @board[i] = token

    end

    def position_taken?(i)

        if @board[i] == " "
            return false
        else
            return true
        end

        #if the board index (i) is empty, FALSE
        #if it's not, TRUE

    end

    def valid_move?(i)

        if i.between?(0,8) == false
            return false
        elsif position_taken?(i) == true
            return false
        else 
            return true
        end

        #if it's not 0-8, FALSE
        #if it's position_taken?, FALSE
        #otherwise, TRUE

    end

    #turn
    #Build a method #turn to encapsulate the logic of a single complete turn composed of the following routine:

    #Ask the user for their move by specifying a position between 1-9.
    #Receive the user's input.
    #Translate that input into an index value.
    #If the move is valid, make the move and display the board.
    #If the move is invalid, ask for a new move until a valid move is received.
    #All these procedures will be wrapped into our #turn method. However, the majority of the logic for these procedures will be defined and encapsulated in individual methods that you've already built.

    #You can imagine the pseudocode for the #turn method:

    #ask for input
    #get input
    #translate input into index
    #if index is valid
    #make the move for index
    #show the board
    #else
    #ask for input again
    #end

    def turn

        puts "Choose a space to put your token!"
        input = gets.chomp
        new_i = input_to_index(input)
        if valid_move?(new_i)
            move(new_i, current_player)
            display_board
        else
            while valid_move?(new_i) == false
            puts "Not a valid move, please choose another space!"
            input = gets.chomp
            new_i = input_to_index(input)
            valid_move?(new_i)
            end
        move(new_i, current_player)
        display_board
        end


    end

    #turn_count
    #This method returns the number of turns that have been played based on the @board variable.

    def turn_count

        @board.count{|token| token == "X" || token == "O"}

    end

    #current_player
    #The #current_player method should use the #turn_count method to determine if it is "X"'s or "O"'s turn.

    def current_player

        turn_count % 2 == 0 ? "X" : "O"

    end

    #won?
    #Your #won? method should return false/nil if there is no win combination present in the board and return the winning combination indexes as an array if there is a win. Use your WIN_COMBINATIONS constant in this method.

    def won?

        WIN_COMBINATIONS.any? do |combination|
            if position_taken?(combination[0])
                if @board[combination[0]] == @board[combination[1]] &&  @board[combination[1]] == @board[combination[2]]
                    return combination
                else
                    false
                end
            end
        end
    
        #if one of the win conditions is true with X's or true with O's, TRUE
        #otherwise FALSE

    end


    #full?
    #The #full? method should return true if every element in the board contains either an "X" or an "O".

    def full?

        if @board.any?{|space| space == " "}
            return false
        else
            return true
        end

    end

    #draw?
    #Build a method #draw? that returns true if the board is full and has not been won, false if the board is won, and false if the board is neither won nor full.


    def draw?

        if full?
            if won?
                return false
            else
                return true
            end
        else
            return false
        end

    end

    #over?
    #Build a method #over? that returns true if the board has been won or is full (i.e., is a draw).

    def over?

        if won?
            return true
        elsif draw?
            return true
        else
            return false
        end
    
    end

    #winner
    #Given a winning @board, the #winner method should return the token, "X" or "O", that has won the game.

    def winner

        if won?
            return turn_count % 2 == 0 ? "O" : "X"
        else
            return nil
        end

    end

    #_____CHECK_EVERYTHING_ELSE_______*******

    def play 

        turn until over? == true
        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end

    end

    #asks for players input on a turn of the game (FAILED - 1)

    #checks if the game is over after every turn (FAILED - 2)
      
    #plays the first turn of the game (FAILED - 3)
      
    #plays the first few turns of the game (FAILED - 4)
      
    #checks if the game is won after every turn (FAILED - 5)
      
    #checks if the game is draw after every turn (FAILED - 6)
      
    #stops playing if someone has won (FAILED - 7)
      
    #congratulates the winner X (FAILED - 8)
      
    #congratulates the winner O (FAILED - 9)
      
    #stops playing in a draw (FAILED - 10)
      
    #prints "Cat's Game!" on a draw (FAILED - 11)
      
    #plays through an entire game (FAILED - 12)

end