require_relative './board'

class Game
  attr_reader :board

  def initialize(args = {})
    @board   = Board.new
    @player1 = args.fetch(:player1)
    @player2 = args.fetch(:player2)
    @winner
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
end
