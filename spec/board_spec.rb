require_relative '../lib/board'
require_relative '../lib/player'

describe Board do

context 'initialize' do
  let(:table){Board.new}  
  it 'equals to array ' do
    expect(table.board).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
  end
end

context 'display_board' do
let(:table){Board.new}
it 'shows the board' do
expect(table.display_board).to eq("    1 | 2 | 3\n    ..|...|..\n    4 | 5 | 6\n    ..|...|..\n    7 | 8 | 9")
end
end














end