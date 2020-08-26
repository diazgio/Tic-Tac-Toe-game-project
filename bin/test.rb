class Board
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

end

class Player  
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
  def input_to_index
    @input - 1
  end

  def move(position, token='X')
    @board[position] = token
  end

  def position_taken?(input)
    @board[input] == "X" || @board[input] == "O"
  end

  def valid_move?(input)
    input.between?(0, 8) && !position_taken?(input)
  end

  def self.turn(display, player)
    @index = input_to_index
    if valid_move?(index)
      move(index, player)
    else
      turn
    end
    display_board
  end
=begin
  def self.turn(display, player, player_choice)
    display[player_choice] = player.token
    current_play = Board.new(display)
    current_play.display_board
  end
=end
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

player_choice = player_one.get_choice(display)
current = Logic.turn(display, player_one)
puts current
=begin
for i in 1..9
  if i % 2 != 0
    player_choice = player_one.get_choice(display)
  else
    player_choice = player_two.get_choice(display)
  end
end
=end