require_relative '../lib/board'
require_relative '../lib/player'

describe Board do

context '#initialize' do
  let(:table){Board.new}  
  it 'equals to array ' do
    expect(table.board).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
  end
end

context '#display_board' do
  let(:table){ Board.new }
  it 'shows the board' do
    expect(table.display_board).to eq("    1 | 2 | 3\n    ..|...|..\n    4 | 5 | 6\n    ..|...|..\n    7 | 8 | 9")
  end
end


context '#full' do
  let(:table){ Board.new }
  it 'cheking if all are no tokens' do
    expect(table.full).to eq(false)
  end
  it 'check if all are tokens' do
    table.instance_variable_set(:@board, %W[X O O X O X O X X])
    expect(table.full).to eq(true)
  end
end

context '#win' do
  let(:table){ Board.new }
  it 'check when nobody win' do
    expect(table.win?).to eq(false)
  end
  it 'check if someone win' do
    table.instance_variable_set(:@board, %W[X X X O 5 6 O 8 9])
    expect(table.win?).to eq(true)
  end
end



end