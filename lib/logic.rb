# rubocop: disable Style/MultipleComparison

class Logic
  def self.turn(arr)
    current_play = Board.new(arr)
    current_play.display_board
    current_play.win?
  end
end

# rubocop: disable Style/MultipleComparison