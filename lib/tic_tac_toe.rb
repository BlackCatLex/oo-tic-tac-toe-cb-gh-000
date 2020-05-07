class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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

  def position_taken?(location)
    unless @board[location] = " " && @board[location].nil?
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      arr = [@board[win_index_1], @board[win_index_2], @board[win_index_3]]

      if arr.all?{|el| el == "X"} || arr.all?{|el| el == "O"}
        return win_combination
      end
    end
    return false
  end

  def draw?
    full? && !won?
  end

  def over?
    full? || won? ? true : false
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def turn_count
    count = 0
    @board.each do |element|
       if element == "X" || element =="O"
         count += 1
       end
    end
    count
  end


  # def full?
  #   @board.flatten.all?{ |el| el=="X" || el=="O" }
  # end

  # def turn
  #   puts "Your move: "
  #   user_choice = input_to_index(gets.strip)
  #   until valid_move?(user_choice)
  #     puts "Pls enter new, valid position"
  #     user_choice = input_to_index(gets.strip)
  #   end
  #   move(user_choice, current_player)
  #   display_board
  # end

end
