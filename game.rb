require_relative './board'
require_relative './computer'

class Game
  attr_reader :board, :over, :game_message

  def initialize(args = {})
    @board    = Board.new
    @computer = Computer.new(mark: args.fetch(:computer_mark))
    @over     = false
  end

  def check_for_winner
    winner_present = false
      if @board.row_contains_winner? || @board.column_contains_winner? || @board.left_to_right_diagonal_winner? || @board.right_to_left_diagonal_winner?
        winner_present = true
      end
    winner_present
  end

  def check_for_stalemate
    (@board.remaining_spots.count == 0 && !check_for_winner) ? true : false
  end

  def computer_move
    computer_choice = @computer.choose_move(@board.remaining_spots)
    @board.add_player_move(computer_choice, @computer.mark)
  end

  def over?
    possible_messages = {
      computer_wins: "The computer beat you!",
      computer_loses: "You beat the computer!",
      stalemate: "You have met your equal. No one wins!"
    }

    if check_for_winner && @board.winning_letter.to_s == @computer.mark
      @game_message = possible_messages[:computer_wins]
      @over = true
    elsif check_for_winner && @board.winning_letter.to_s != @computer.mark
      @game_message = possible_messages[:computer_loses]
      @over = true
    elsif check_for_stalemate
      @game_message = possible_messages[:stalemate]
      @over = true
    end
  end
end
