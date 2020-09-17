require 'pry'


class TicTacToe

    WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [6, 4, 2]
    ]
  
    
  def initialize
    @board = Array.new(9, " ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index, current_player = "X")
    @board[index] = current_player
    
  end
  
  def position_taken?(position)
    if @board[position] == "X" || @board[position] == "O"
      true
    else
      false
    end 
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    turn = 0
    @board.each do |index|
      if index == "X" || index == "O"
        turn += 1
      end
    end
    return turn
  end
  
  def current_player
    current_turns = turn_count
    if current_turns % 2 == 0
      player = "X"
    else
      player = "O"
    end
    return player
     end
  
     def turn
        puts "Please choose a number 1-9:"
        user_input = gets.chomp
        index = input_to_index(user_input)
        if valid_move?(index)
          player_token = current_player
          move(index, player_token)
          display_board
        else
          turn
        end
      end
    
  
      def won?

        board_empty = @board.none? { |i| i == "X" || i = "O"}
        if board_empty
          false
        else 
          WIN_COMBINATIONS.each do |combo| 
            if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" || @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
              return combo
            end
          end
          return false
      end
    end
  
  
    def full?
        @board.all? {|index| index == "X" || index == "O"}
      end
      
      def draw?
        if !won? && full?
          return true
        else
          return false
        end
      end
      
      def over?
        if won? || draw?
          return true
        else
          return false
        end
      end
      
      def winner
        if won?
            @board[won?[0]] 
        
        end
      end
      
      def play
        until over? == true
          turn
        end      
        if won?
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
      end
        
end
 


    
