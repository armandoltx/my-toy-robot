require "spec_helper"
require_relative "../lib/robot"
require_relative "../lib/board"
require_relative "../lib/position"
require_relative "../lib/commands/place_command"

RSpec.describe Robot do
  let!(:robot) { Robot.new }
  let!(:board) { Board.new }
  let!(:input) { "PLACE 0,0,NORTH" }

  describe "#placed?" do
    it "is not placed" do
      expect(robot.placed?).to be false
    end

    it "is placed" do
      PlaceCommand.new(robot: robot, board: board, input: input).perform

      expect(robot.placed?).to be true
    end
  end

  describe "#report" do
    it "is placed" do
      PlaceCommand.new(robot: robot, board: board, input: input).perform

      expect(robot.report).to eq("0,0,NORTH")
    end

    it "is not placed" do
      expect(robot.report).to eq("Robot is not placed.")
    end
  end

  describe "#can_i_move?" do
    it "returns true" do
      position= Position.new(x_axis: 1, y_axis: 2, direction: "SOUTH")
      expect(robot.can_i_move?(position, board)).to be true
    end

    it "returns false" do
      position= Position.new(x_axis: 5, y_axis: 5, direction: "NORTH")
      expect(robot.can_i_move?(position, board)).to be false
    end
  end
end