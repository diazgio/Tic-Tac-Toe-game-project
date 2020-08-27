class Board
  attr_accessor :board
  def initialize(board)
    @board = board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts " ----------- "
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts " ----------- "
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def win?
    @win = false
    @win = true if board[0] == board[1] && board[1] == board[2]
    @win = true if board[0] == board[4] && board[4] == board[8]
    @win = true if board[0] == board[3] && board[3] == board[6]
    @win = true if board[1] == board[4] && board[4] == board[7]
    @win = true if board[2] == board[4] && board[4] == board[6]
    @win = true if board[2] == board[5] && board[5] == board[8]
    @win = true if board[3] == board[4] && board[4] == board[5]
    @win = true if board[6] == board[7] && board[7] == board[8]
    return @win

  end

end

class Player
  attr_accessor :token, :name
  def initialize(name, token)
    @name = name
    @token = token
  end

  def to_s
    "Player: #{@name}--#{@token}"
  end

  def get_choice(display)
    loop do
      puts "Please enter a number between 1 to 9: "
      choice = gets.chomp.to_i
      index = choice - 1
      if choice.between?(1,9)
        return index
        break
      else
        puts "Wrong position, please choose anthor one"
      end
    end
  end
end

class Logic

  def self.turn(display, player, player_choice)
    valid = false
    while !valid
      if display.board[player_choice] == "X" || display.board[player_choice] == "O"
        puts "Wpong postion, please choose another one"
        valid = false
      else
        valid = true
        display.board[player_choice] = player.token
      end
      break
    end

    display.display_board
    display.win?
  end

  def self.reset
    options = ['y','n','yes','no']
    
    loop do
      puts "Do you wanna play again?: (y/n)"
      player_option = gets.chomp.downcase
      if options.include? player_option
        if player_option == 'yes' || player_option == 'y'
          check = true
          return check
        else
          check = false
          return check
        end
      else
        puts "Sorry, wrong option pleas enter a valid option."
      end
      check
    end
  end

end

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