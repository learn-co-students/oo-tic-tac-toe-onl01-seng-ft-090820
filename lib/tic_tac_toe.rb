#create a tictactoe board by first creating a class
#use initialize method to start a new game of tictactoe with a clear @board(array w 9 empty strings)
#initialize method should set @board = to a new array, empty array to represent game board
#define win_combinations using index values associated w the board spaces(0-8)
#define display_board so it prints(puts) the board based on the instance variable @board
#define input_to_index so we can pass user input(as a string) and return the corresponding index of the @board array
#the board has 9 spaces but index starts w 0
#move method mustr have 2 arguments: index for the placement of the token and the token itself "X" or "O"
#position_taken? method evaluates the user's move and whether or not it is occupied (should return flase if free, otherwise return true)
#valid_move? method accepts the position chosen and returns true if it is, and false if not (on the board, and free)
#turn method 


class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
    ]
    
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts " ------------ "
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts " ------------ "
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
    def input_to_index(user_input)
      user_input.to_i - 1
    end
    
    def move(index, current_player = "X")
      @board[index] = current_player
    end
    
    def position_taken?(index)
     @board[index] != (" ")
   end
   
   def valid_move?(index)
     index.between?(0,8) && !position_taken?(index)
   end
   
   def turn_count
    turns_played = 0
  @board.each do |index|
    if index == "X" || index == "O"
      turns_played += 1
    end
  end
  return turns_played
end
   
   def turn
     puts "Please enter 1-9:"
     user_input = gets.chomp
     index = input_to_index(user_input)
    if valid_move?(index)
      token = current_player
      move(index, token)
      display_board
    else
      turn
    end
  end
     
  def current_player
       num_turns = turn_count
  if num_turns % 2 == 0
    player = "X"
  else
    player = "O"
  end
  return player
end
      
   def won?
    WIN_COMBINATIONS.any? do |combo|
      if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
        return combo
      end 
    end 
  end  
      
  def full?
    @board.all? {|index| index != " "}
  end
  
  def draw?
    if full? && !won?
      return true
    end
  end
  
  def over?
    full? || won? || draw?
  end
  
  def winner
    if combo = won?
      @board[combo[0]]
   end
  end
  
  def play
    until over?
      turn
    end
  if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
  