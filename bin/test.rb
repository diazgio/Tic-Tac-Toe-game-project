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

end

class Logic

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

