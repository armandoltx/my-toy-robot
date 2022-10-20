require "spec_helper"
require_relative "../../lib/robot"
require_relative "../../lib/board"
require_relative "../../lib/position"
require_relative "../../lib/commands/move_command"
require_relative "../../lib/commands/place_command"

RSpec.describe MoveCommand do
  describe "#perform" do
    let!(:robot) { Robot.new }
    let!(:board) { Board.new }
    let!(:move_command) { MoveCommand.new(robot: robot, board: board) }

    context "robot not placed" do
      it "is not placed" do
        move_command.perform
        expect(robot.report).to eq("Robot is not placed.")
      end
    end

    context "robot is placed" do
      it "is facing NORTH and move, Y axis increases by 1" do
        input = "PLACE 2,2,NORTH"
        PlaceCommand.new(robot: robot, board: board, input: input).perform
        move_command.perform
        expect(robot.report).to eq("2,3,NORTH")
      end

      it "is facing EAST and move, X axis increases by 1" do
        input = "PLACE 2,2,EAST"
        PlaceCommand.new(robot: robot, board: board, input: input).perform
        move_command.perform
        expect(robot.report).to eq("3,2,EAST")
      end

      it "is facing SOUTH and move, X axis decreases by 1" do
        input = "PLACE 2,2,SOUTH"
        PlaceCommand.new(robot: robot, board: board, input: input).perform
        move_command.perform
        expect(robot.report).to eq("2,1,SOUTH")
      end

      it "is facing WEST and move, Y axis decreases by 1" do
        input = "PLACE 2,2,WEST"
        PlaceCommand.new(robot: robot, board: board, input: input).perform
        move_command.perform
        expect(robot.report).to eq("1,2,WEST")
      end
    end
  end
end
