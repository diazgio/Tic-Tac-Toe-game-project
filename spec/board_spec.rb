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
  it 'checks if all are not tokens' do
    expect(table.full).to eq(false)
  end
  it 'checks if all are tokens' do
    table.instance_variable_set(:@board, %W[X O O X O X O X X])
    expect(table.full).to eq(true)
  end
end

context '#win' do
  let(:table){ Board.new }
  it 'checks when nobody win' do
    expect(table.win?).to eq(false)
  end
  it 'checks if someone win' do
    table.instance_variable_set(:@board, %W[X X X O 5 6 O 8 9])
    expect(table.win?).to eq(true)
  end
end

context '#get_choice' do 
  let(:table) { Board.new}
  it 'gets player argument if true' do
      argument = 5
      expect(table.get_choice(5)).to eq(5-1)
  end
  it 'returns false if player argument is wrong' do
      argument = 12
      expect(table.get_choice(12)).to eq(false)
  end
end

context '#valid_move' do
  let(:table){ Board.new }
  it 'check if position it is taken' do
    arg = 0
    table.instance_variable_set(:@board, %W[X 2 3 O X 6 O 8 9])
    expect(table.valid_move(arg)).to eq(false)
  end
  it 'check if position is not taken' do
    arg = 2
    table.instance_variable_set(:@board, %W[X 2 3 O X 6 O 8 9])
    expect(table.valid_move(arg)).to eq(true)
  end
end

context '#update' do
  let(:table){ Board.new }
  let(:first_player){ Player.new('Gior','X')}
  let(:second_player){ Player.new('Ade','O')}
  it 'check the change of the number for the token' do
    arg = 0
    table.instance_variable_set(:@board, %W[X 2 3 O X 6 O 8 9])
    expect(table.update(arg, first_player)).to eq('X')
  end
  it 'check the change of the number for the token' do
    arg = 3
    table.instance_variable_set(:@board, %W[X 2 3 O X 6 O 8 9])
    expect(table.update(arg, second_player)).to eq('O')
  end
end

context '#switch_player' do
  let(:table){ Board.new }
  let(:first_player){ Player.new('Gior','X')}
  let(:second_player){ Player.new('Ade','O')}
  it 'change turn to second_player' do
    arr_players = [first_player, second_player]
    current_player = arr_players[0]
    expect(table.switch_player(current_player, arr_players)).to eq(arr_players[1])
  end
  it 'change turn to second_player' do
    arr_players = [first_player, second_player]
    current_player = arr_players[1]
    expect(table.switch_player(current_player, arr_players)).to eq(arr_players[0])
  end
end
end