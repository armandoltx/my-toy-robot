require "spec_helper"
require_relative "../lib/board"

RSpec.describe Board do
  describe "#is_valid?" do
    let(:no_board) { Board.new(height:-5, width: 5) }
    let(:valid_board) { Board.new(height:5, width: 5) }
    let(:default_board) { Board.new }

    it "is not a valid board" do
      expect(no_board.is_valid?).to be false
    end

    it "is a valid board" do
      expect(valid_board.is_valid?).to be true
    end

    it "have x and y by default" do
      expect(default_board.width).to be 4
      expect(default_board.height).to be 4
    end
  end
end
