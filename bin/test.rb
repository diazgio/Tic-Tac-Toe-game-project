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
    return win
  end

end

class Player
  attr_accessor :token
  def initialize(name, token)
    @name = name
    @token = token
  end

  def to_s
    "Player: #{@name}--#{@token}"
  end

  def get_choice(display)
    puts "Please enter a number between 1 to 9: "
    choice = gets.chomp.to_i
    @input = choice
    loop do
      if choice.between?(1,9)
        return choice
      else
        puts "Wrong number, please choose anthor number"
      end
    end
  end
end

class Logic

  def self.turn(display, player, player_choice)
    display.board[player_choice] = player.token
    display.display_board
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

display = Board.new(Array.new(9, " "))
display.display_board

for i in 1..9
  if i % 2 != 0
    player_choice = player_one.get_choice(display)
    current = Logic.turn(display, player_one, player_choice)
    if current == true
      win_lose = true
      puts "\nCongratulations, #{Player1.name}. You win!"
      break
    end
  else
    player_choice = player_two.get_choice(display)
    current = Logic.turn(display, player_two, player_choice)
    if current == true
      win_lose = true
      puts "\nCongratulations, #{Player1.name}. You win!"
      break
    end
  end
end
