class Board
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
    diagonal_marks.uniq.count == 1 ? answer = true : answer
    answer
  end

  def right_to_left_diagonal_winner?
    answer = false
    # find the index to begin with by fnding the length minus 1
    beginning_index = @board.count - 1
    # find how many times to do the iteration
    iterations = @board.count
    # collect each mark in an array
    diagonal_marks = []
    # subtract 1 from the beginning index number while adding one to the row number [+1][-1]
    row = 0
    iterations.times do
      diagonal_marks << @board[row][beginning_index]
      row +=1
      beginning_index -= 1
    end
    # check array with .uniq
    diagonal_marks.uniq.count == 1 ? answer = true : answer
    answer
  end

  def remaining_spots
    @board.flatten.select { |spot| spot.class == Fixnum }
  end
  
end
