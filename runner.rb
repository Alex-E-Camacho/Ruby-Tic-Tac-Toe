require_relative './game'


game = Game.new(player1: "Alex", player2: "Jane")

game.board.render_board

until game.over == true
  puts "Please choose a space."

  space = gets.chomp.to_i
  # puts "Please choose a mark."

  mark  = "x"

  game.board.add_player_move(space, mark)
  game.over?
end
