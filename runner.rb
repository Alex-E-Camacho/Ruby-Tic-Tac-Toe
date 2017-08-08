require_relative './game'

puts "Press 1 to be X's or 2 to be O's."

players_choice = gets.chomp

if players_choice == "1"
  player_mark = "X"
  computer_mark = "O"
else
  player_mark = "O"
  computer_mark = "X"
end

game = Game.new(computer_mark: computer_mark)

game.board.render_board

until game.over == true
  puts "Please choose a space."

  player_space = gets.chomp.to_i

  game.board.add_player_move(player_space, player_mark)
  game.over?
  sleep(2)
  puts "Now the computer will choose."
  sleep(2)
  game.computer_move
  game.over?
end
