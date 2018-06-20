class TicTacToe
  attr_accessor :board
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
 
 def input_to_index(input)
   input = gets.strip
   index = input.to_i - 1
 end 
  
  def move(index, token = "X")
    if valid_move?(index)
      @board[index] = token
    end
  end
  
  def position_taken?(board)
    if @board[board] == "X" || @board[board] == "O"
      true
    else
      false
    end 
  end 
  
  def valid_move?(board)
    position = position.to_i - 1
    if board.between?(0,8) && !position_taken?(board)
      true
    else
      false
    end
  end 
  
  def turn
    display_board
    puts "Please enter 1-9:"
    input = gets.strip
    
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won?

  end 
  
  def full?
    @board.all? { |i| i =="X" || i == "O"}
  end 
  
  def draw?
    won? && full? 
  end 
  
  def over?
    won? || full? || draw?
  end 
  
  def winner
        WIN_COMBINATIONS.detect do |combo| 
          if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" 
            return "X"
          elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
            return "O"
          else 
            nil
          end
        end
  end 
  
  def play 
     until over?
      turn
      end
      
    if won? 
      puts "Congratulations #{winner}!"
    end
    
    if draw?
      puts "Cat's Game!"
    end
    display_board
 end

end