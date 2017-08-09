require_relative './game'

puts "Press 1 to be X's or 2 to be O's."

player_choice = gets.chomp

  if player_choice == "1"
    player_mark   = "X"
    computer_mark = "O"
  else
    player_mark   = "O"
    computer_mark = "X"
  end

game = Game.new(computer_mark: computer_mark)

game.board.render_board

until game.over == true
  sleep(1)
  puts "Choose a space to place your #{player_mark}."

  player_space = gets.chomp.to_i

  game.board.add_player_move(player_space, player_mark)

    if game.over?
      puts game.game_message
      sleep(0.5)
      puts "Would you like to play again?"
      puts "Type 1 to replay or 2 to exit."
      replay_option = gets.chomp
      replay_option == "1" ? game.reset_game : break
    end

  sleep(1.5)

  puts "Now the computer will choose."

  sleep(2)

  game.computer_move

    if game.over?
      puts game.game_message
      sleep(0.5)
      puts "Would you like to play again?"
      puts "Type 1 to replay or 2 to exit."
      replay_option = gets.chomp
      replay_option == "1" ? game.reset_game : break
    end
end
