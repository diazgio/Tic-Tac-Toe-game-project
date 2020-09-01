require_relative '../lib/player'

describe Player do
  let (:player) {Player.new("gio","X")}

  context "initialize" do
    it "Take player name" do
      expect(player.name).to eq("gio")
    end
    it "Set player token" do
      expect(player.token).to eq("X")
    end

  end


end
