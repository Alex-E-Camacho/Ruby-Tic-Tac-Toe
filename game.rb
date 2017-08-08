require_relative './board'
require_relative './computer'

class Game
  attr_reader :board, :over

  def initialize(args = {})
    @board    = Board.new
    @computer = Computer.new(mark: args.fetch(:computer_mark))
    @over     = false
  end

  def check_for_winner
    winner_present = false
      if @board.row_contains_winner? == true || @board.column_contains_winner? == true || @board.left_to_right_diagonal_winner? == true || @board.right_to_left_diagonal_winner? == true
        winner_present = true
      end
    winner_present
  end

  def check_for_stalemate
    (@board.remaining_spots.count == 0 && check_for_winner == false) ? true : false
  end

  def computer_move
    computer_choice = @computer.choose_move(@board.remaining_spots)
    @board.add_player_move(computer_choice, @computer.mark)
  end

  def over?
    if check_for_winner || check_for_stalemate
      @over = true
    end
  end
end
