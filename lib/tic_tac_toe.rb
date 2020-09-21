class TicTacToe

    def initialize
        @board = Array.new(9," ")
    end 

    WIN_COMBINATIONS = 
    [ [0,1,2], 
      [3,4,5],  
      [6,7,8], 
      [0,3,6],  
      [1,4,7],  
      [2,5,8],  
      [0,4,8],  
      [2,4,6], ]

    def  display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end 

    def input_to_index(string)
        @choose = string.to_i - 1
    end 

    def move(input_to_index, player)
        @board[input_to_index] = player 
    end 

    def position_taken?(input_to_index)
       if @board[input_to_index] == 'X' || @board[input_to_index] == 'O'
        true 
       else 
        false
       end
    end 

    def valid_move?(input_to_index)
        !position_taken?(input_to_index) && @board[input_to_index]
    end 

    def turn_count
        count = 0 
        @board.each do |i|
            count +=1 if i == "X" || i == "O"
        end 
    count
    end 

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end 

    # def turn 
    #     puts "Please enter a number 1-9:"
    #     choice = gets.strip
    #     position = input_to_index(choice)
    # if valid_move?(position)
    #     move(position,current_player) 
    #     display_board
    # elsif 
    #     turn
    # end 
    # end 

    # def turn 
    #     puts "Please enter 1-9"
    #     input = gets.strip
    #     index = input_to_index(input)
    #     if valid_move?(index)
    #         token = current_player
    #         move(index,token)
    #     else 
    #         turn
    #     end 
    #     display_board
    # end 

    # def turn 
    #     puts "Please enter 1-9:"
    #     user_input = gets.strip
    #     index = input_to_index(user_input)
    # if  valid_move?(index)
    #     move(index, current_player)
    #     display_board
    # else 
    #     turn
    # end 
    # end 

    def turn 
        puts "It's #{current_player}'s turn."
        puts "Please enter 1-9:"
        input = gets.strip 
        if input == exit 
          over?(exit)
        end 
        index = input_to_index(input)
        if valid_move?(index)
          move(index, current_player)
          display_board 
        else 
          turn 
        end 
      end


    def won?
        WIN_COMBINATIONS.detect do |combo|
            @board[combo[0]] == @board[combo[1]] &&
            @board[combo[1]] == @board[combo[2]] &&
            position_taken?(combo[0])
        end
    end 

    def full?
        !@board.any?{|x| x == "" || x == " "}
    end

    def draw?
        !won? && full?
    end

    def over?
        won? || draw?
    end

    def winner 
        if winning_combo = won?
            @board[winning_combo.first]
        end
    end 

    def play 
        while !over?
            turn 
        end 
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end 
    end 

end 
