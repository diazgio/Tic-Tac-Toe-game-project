# rubocop: disable Metrics/CyclomaticComplexity

# rubocop: disable Metrics/PerceivedComplexity

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
      return index
    else
      false
    end
  end

  def valid_move(player_choice, player)
    if @board[player_choice] == 'X' || @board[player_choice] == 'O'
      return false
    else
      true
    end
  end

  def update(player_choice, player)
    @board[player_choice] = player.token
  end

  def switch_player(count,switch_players)
    if count % 2 != 0
      switch_players[0]
    else
      switch_players[1]
    end
  end

end

# rubocop: enable Metrics/CyclomaticComplexity

# rubocop: enable Metrics/PerceivedComplexity
