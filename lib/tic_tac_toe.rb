# Helper Method
class TicTacToe

def initialize
  @board = [" "," "," "," "," "," "," "," "," "]
end


def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
def won?
  WIN_COMBINATIONS.detect do |set|
    @board[set[0]] == @board[set[1]] &&
    @board[set[1]] == @board[set[2]] &&
    position_taken?(set[0])
  end
end

def full?
  @board.all? {|value| value == "X" || value == "O"}
end

def draw?
  full? && !won?
end

def over?
  won? || draw?
end

def winner
  if winning_combo = won?
    winning_combo.first
  end
end


def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def turn_count
  count = 0
  @board.each do |location|
    if location != " "
      count+=1
    end
  end
  return count
end

def current_player
  turn_count % 2 == 0 ? "X": "O"
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(@board, index, current_player)
  @board[index] = current_player
end

def valid_move?(@board, index)
  index.between?(0,8) && !position_taken?(@board, index)
end

def turn(@board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(@board, index)
    move(@board, index, current_player(@board))
    display_@board(@board)
  else
    turn(@board)
  end
end

# Define your play method below
def play(@board)
  display_@board(@board)
  until over?(@board)
    turn(@board)
  end

  if won?(@board)
    puts ("Congratulations #{winner(@board)}!")
  elsif draw?(@board)
    puts ("Cat's Game!")
  end
end

end
