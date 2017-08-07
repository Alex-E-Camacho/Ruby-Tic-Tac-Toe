class TicTacToeBoard

  def initialize
    @spaces = 9
    @board = (1..@spaces).to_a.each_slice(3).to_a
  end

  def render_board
    @board.each { |arr| p arr }
  end
end
