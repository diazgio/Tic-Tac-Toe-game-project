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

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [6, 4, 2],
  [0, 4, 8]
]

  def win?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]]
    end
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
        puts "Wrong number, please choose anthor number"
      end
    end
  end
end

class Logic

  def self.turn(display, player, player_choice)
    display.board[player_choice] = player.token
    display.display_board
    display.win?
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
loop do
  display = Board.new(Array.new(9, " "))
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
end