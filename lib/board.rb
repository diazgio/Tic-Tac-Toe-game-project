# frozen_string_literal: true

# rubocop:disable Style/Documentation

class Board
  attr_accessor :board
  def initialize(board)
    @board = board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts ' ----------- '
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts ' ----------- '
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
    @win
  end
end

# rubocop:enable Style/Documentation
