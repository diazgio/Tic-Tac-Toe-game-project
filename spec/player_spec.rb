require_relative '../lib/player'

describe Player do
  let (:first_player) { Player.new('Gior', 'X') }
  let (:second_player) { Player.new('Ade', 'O') }
  context 'Initialize' do
    it 'return name' do
      expect(first_player.name).to eq('Gior')
    end
    it 'return token' do
      expect(first_player.token).to eq('X')
    end
    it 'return name' do
      expect(second_player.name).to eq('Ade')
    end
    it 'return token' do
      expect(second_player.token).to eq('O')
    end
  end
end