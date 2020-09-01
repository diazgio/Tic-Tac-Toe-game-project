require_relative '../lib/board'
require_relative '../lib/player'

describe Board do
  context "initialize" do
    let(:board1) {Board.new}
    it "Creat the board array" do
      expect(board1.board).to eq((1..9).to_a)
    end
  end

  context "display_board" do
    let (:board1) {Board.new}
    it "Print the board" do
      expect(board1.display_board).to eq("    1 | 2 | 3\n    ..|...|..\n    4 | 5 | 6\n    ..|...|..\n    7 | 8 | 9")
    end
  end

  context "full" do
    let (:board1) {Board.new}
    it "Check if the board is full" do
      expect(board1.full).to eq(false)
    end
  end

  context "win?" do
    let (:board1) {Board.new}
    it "Checks if there is a winner by checking the patterns" do
      expect(board1.win?).to be false
    end
  end

  context "get_choice" do
    let (:board1) {Board.new}

    it "Gets user input if is true" do
      input = 6
      expect(board1.get_choice(input)).to eq(input - 1)
    end

    it "If user input is false" do
      input = 10
      expect(board1.get_choice(input)).to eq(false)
    end
  end

  context "valid_move" do
    let (:board1) {Board.new}
    it "check if the board space not available" do
      board1.instance_variable_set("@board", ["O", 2, "X", 4, 5, 6, 7, 8, 9] )
      expect(board1.valid_move(2)).to eq(false)
    end

    it "Check if the board space is available" do
      player_choice = 4
      expect(board1.valid_move(player_choice)).to eq(true)
    end
  end

  context "update" do
    let (:board1) {Board.new}
    let (:token1) {Player.new("gio", "X")}
    it "Update the player choice with the token" do
      expect(board1.update(2, token1)).to eq(board1.instance_variable_set("@board", "X" ))
    end
  end

  context "switch_player" do
    let (:board1) {Board.new}
    it "Change to the next player" do
      switch_player = [0, 1]
      expect(board1.switch_player(0, 1)).to eq(1)
    end
  end
end

