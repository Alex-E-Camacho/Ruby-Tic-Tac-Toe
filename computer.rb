class Computer
  attr_accessor :mark
  attr_reader :space

  def initialize(args={})
    @mark = args.fetch(:mark)
    @space
  end

  def choose_move(arr_of_remaining_spaces)
    @space = arr_of_remaining_spaces.sample
  end
end
