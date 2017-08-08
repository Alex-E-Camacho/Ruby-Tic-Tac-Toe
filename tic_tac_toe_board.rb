class TTTBoard
  attr_reader :board

  def initialize
    @spaces = 9
    @board  = (1..@spaces).to_a.each_slice(3).to_a
  end

  def render_board
    @board.each { |arr| p arr }
  end

  def add_player_move(space, mark)
    @board = @board.map do |row|
      row.map { |num| num == space ? num = mark : num }
    end
    render_board
  end

  def row_contains_winner?
    answer = false
    @board.each { |row| row.uniq.count == 1 ? answer = true : answer }
    answer
  end

  def column_contains_winner?
    answer = false
    @board.transpose.each { |row| row.uniq.count == 1 ? answer = true : answer }
    answer
  end

  def left_to_right_diagonal_winner?
    answer = false
    board_range = @board.count - 1
    diagonal_marks = (0..board_range).collect { |i| @board[i][i] }
    diagonal_marks.uniq.count == 1 ? answer = true : false 
    answer
  end
end
