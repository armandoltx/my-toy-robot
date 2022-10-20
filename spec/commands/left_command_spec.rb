require "spec_helper"
require_relative "../../lib/robot"
require_relative "../../lib/board"
require_relative "../../lib/position"
require_relative "../../lib/commands/place_command"
require_relative "../../lib/commands/left_command"


RSpec.describe LeftCommand do
  describe "#perform" do
    let!(:robot) { Robot.new }
    let!(:board) { Board.new }
    let!(:left_command) { LeftCommand.new(robot: robot) }

    context "robot not placed" do
      it "is not placed" do
        left_command.perform
        expect(robot.report).to eq("Robot is not placed.")
      end
    end

    context "robot is placed" do
      it "when facing NORTH go WEST" do
        input = "PLACE 2,2,NORTH"
        PlaceCommand.new(robot: robot, board: board, input: input).perform
        left_command.perform
        expect(robot.report).to eq("2,2,WEST")
      end

      it "when facing WEST go SOUTH" do
        input = "PLACE 2,2,WEST"
        PlaceCommand.new(robot: robot, board: board, input: input).perform
        left_command.perform
        expect(robot.report).to eq("2,2,SOUTH")
      end

      it "when facing SOUTH go EAST" do
        input = "PLACE 2,2,SOUTH"
        PlaceCommand.new(robot: robot, board: board, input: input).perform
        left_command.perform
        expect(robot.report).to eq("2,2,EAST")
      end

      it "when facing EAST go NORTH" do
        input = "PLACE 2,2,EAST"
        PlaceCommand.new(robot: robot, board: board, input: input).perform
        left_command.perform
        expect(robot.report).to eq("2,2,NORTH")
      end
    end
  end
end
