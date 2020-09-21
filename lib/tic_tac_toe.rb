class TicTacToe #allows us to make instances of TicTacToe
  
WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  
  ]
  def initialize 
   @board = Array.new(9," ")
  end
  
  def display_board #prints current board based on @board instance var
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-------------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-------------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
   user_input.to_i - 1 #.to_i converts into an integer
  end
  
  def move(index, current_player = "X") #so whatever index we pass through, place a player token
    @board[index] = current_player
  end
  
  def position_taken?(index) # || or statement, will return a boolean (T or F)
    !(@board[index].nil? || @board[index] == " ") #! bang operator; if this is not the case then return true, if it is the case return false
  end
  
  def valid_move?(index)
    (@board[index].nil? || @board[index] == " ") && index.between?(0,8)
  end
  
  def turn_count
    turn = 0 #we create a counter
    @board.each do |index| #create an each loop to show the taking of a turn, the player will either put X or O
      if index == "X" || index == "O"
        turn += 1 #increment the counter by 1 to show turns
      end
    end
    return turn #returns the number of turns
  end
  
  def current_player #if the turn count is an even number, that means O just went.
    number_turns = turn_count
    if number_turns % 2 == 0 #if number of turn is divisible by 2, then its player X turn
      current_player = "X"
    else
      current_player = "O"
    end
    return current_player
  end
  
  def turn
    puts "Please choose a number 1-9" #asking for input
    user_input = gets.strip #getting the input
    index = input_to_index(user_input) #translate input into an index
    cp = current_player
    if valid_move?(index)
      move(index, cp)
      display_board
    else
      turn
    end
  end
  
  def won?
  WIN_COMBINATIONS.detect do |win_combo|
    if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
      return win_combo
    elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
      return win_combo
    end
      false
  end
end
  
  def full?
    @board.all? {|index| index == "X" || index == "O"}
  end
  
  def draw?
    !(won?) && (full?)
  end

  def over?
    won? || full? || draw?
  end
  
  def winner
  WIN_COMBINATIONS.detect do |win_combo|
    if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
      return "X"
    elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
      return "O"
    else
      nil
    end
  end
end
  
  def play
    until over? || draw? || won? == true
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    else
      false
    end
  end
  
end




TicTacToe.new #creating a new instance of the TicTacToe Class; .new is a class method that you get just from making the Class 