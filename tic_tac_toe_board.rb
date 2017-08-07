class TicTacToeBoard

  def initialize
    @spaces = 9
  end

  def render_board
    @board = (1..@spaces).to_a.each_slice(3).to_a
  end
end
