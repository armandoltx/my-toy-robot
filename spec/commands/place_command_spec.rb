require "spec_helper"
require_relative "../../lib/robot"
require_relative "../../lib/board"
require_relative "../../lib/position"
require_relative "../../lib/commands/place_command"


RSpec.describe PlaceCommand do
  let!(:robot) { Robot.new }
  let!(:board) { Board.new }
  let!(:input) { "PLACE 0,0,NORTH" }

  describe "#perform" do
    it "is no board" do
      no_board = nil
      command = PlaceCommand.new(robot: robot, board: no_board, input: input)

      expect do
        command.perform
      end.to output("Please, set up a board.\n").to_stdout
    end

    it "is a board, but no valid input" do
      no_valid_input = "PLACE"

      command = PlaceCommand.new(robot: robot, board: board, input: no_valid_input)

      expect do
        command.perform
      end.to output("the command placed is wrong, Must be similar to: 'PLACE 0,0,NORTH'\n").to_stdout
    end

    it "is a board, and a valid input" do
      command = PlaceCommand.new(robot: robot, board: board, input: input)
      command.perform

      expect(robot.report).to eq("0,0,NORTH")
    end
  end

  describe "#is_valid?" do
    it "is not valid" do
      no_valid_input = "PLACE"
      command = PlaceCommand.new(robot: robot, board: board, input: no_valid_input)
      expect(command.is_valid?(no_valid_input)).to be false
    end

    it "is valid" do
      command = PlaceCommand.new(robot: robot, board: board, input: input)
      expect(command.is_valid?(input)).to be true
    end
  end
end