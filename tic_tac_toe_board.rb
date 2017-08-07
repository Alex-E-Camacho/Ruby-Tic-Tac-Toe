class TicTacToeBoard
  attr_reader :board

  def initialize
    @spaces = 9
    @board = (1..@spaces).to_a.each_slice(3).to_a
  end

  def render_board
    @board.each { |arr| p arr }
  end

  def add_player_move(space, mark)
    @board = @board.map do |row|
      row.map { |num| num == space ? num = mark : num }
    end
  end
end
