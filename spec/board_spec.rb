require_relative '../lib/board'

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
end

