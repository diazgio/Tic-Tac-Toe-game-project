# rubocop: disable Metrics/CyclomaticComplexity

# rubocop: disable Metrics/PerceivedComplexity

# rubocop: disable Style/GuardClause

class Board
  attr_accessor :board
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display_board
    "    #{@board[0]} | #{@board[1]} | #{@board[2]}
    ..|...|..
    #{@board[3]} | #{@board[4]} | #{@board[5]}
    ..|...|..
    #{@board[6]} | #{@board[7]} | #{@board[8]}"
  end

  def full
    @board.all?(String)
  end

  def win?
    @win = false
    @win = true if @board[0] == @board[1] && @board[1] == @board[2]
    @win = true if @board[0] == @board[4] && @board[4] == @board[8]
    @win = true if @board[0] == @board[3] && @board[3] == @board[6]
    @win = true if @board[1] == @board[4] && @board[4] == @board[7]
    @win = true if @board[2] == @board[4] && @board[4] == @board[6]
    @win = true if @board[2] == @board[5] && @board[5] == @board[8]
    @win = true if @board[3] == @board[4] && @board[4] == @board[5]
    @win = true if @board[6] == @board[7] && @board[7] == @board[8]
    @win
  end

  def get_choice(choice)
    index = choice - 1
    if @board.include? choice
      index
    else
      false
    end
  end

  def valid_move(player_choice)
    if @board[player_choice] == 'X' || @board[player_choice] == 'O'
      false
    else
      true
    end
  end

  def update(player_choice, player)
    @board[player_choice] = player.token
  end

  def switch_player(current_player, switch_players)
    if current_player == switch_players[1]
      switch_players[0]
    elsif current_player == switch_players[0]
      switch_players[1]
    end
  end
end

# rubocop: enable Metrics/CyclomaticComplexity

# rubocop: enable Metrics/PerceivedComplexity

# rubocop: enable Style/GuardClause
