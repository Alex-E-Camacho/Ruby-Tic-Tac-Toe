class Computer
  attr_reader :mark, :space

  def initialize(args={})
    @mark = args.fetch(:mark)
  end

  def choose_move(arr_of_remaining_spaces)
    @space = arr_of_remaining_spaces.sample
  end
end
