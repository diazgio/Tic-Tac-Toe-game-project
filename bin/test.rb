# rubocop: disable Style/StringLiterals
require '../lib/board.rb'
require '../lib/player.rb'
require '../lib/logic.rb'

puts " Hello and welcome to Tic Tac Toe Game."
puts "First player enter your nickname: "
name_one = gets.chomp
player_one = Player.new(name_one, 'X')
puts "First player name: #{name_one}, your token is 'X' "
puts "Second player enter your nickname: "
name_two = gets.chomp
player_two = Player.new(name_two, 'O')
puts "Second player name: #{name_two}, your token is 'O' "

win_lose = false
while !win_lose
  arr = [1,2,3,4,5,6,7,8,9]
  display = Board.new(arr)
  display.display_board

  for i in 1..9
    if i % 2 != 0
      player_choice = player_one.get_choice(display)
      current = Logic.turn(display, player_one, player_choice)
      if current == true
        win_lose = true
        puts "\nCongratulations, #{player_one.name}. You win!"
        break
      end
    else
      player_choice = player_two.get_choice(display)
      current = Logic.turn(display, player_two, player_choice)
      if current == true
        win_lose = true
        puts "\nCongratulations, #{player_two.name}. You win!"
        break
      end
    end
  end

  if win_lose == false
    puts "You've both tied, #{name_one} and #{name_two}"
  end

  reset_game = Logic.reset
  if reset_game == true
    puts "Let\s start"
    win_lose = false
  else
    break
  end
end

# rubocop: disable Style/StringLiterals
