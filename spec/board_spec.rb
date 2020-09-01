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
end

