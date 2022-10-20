require "spec_helper"
require_relative "../lib/parser"
require_relative "../lib/robot"
require_relative "../lib/board"
require_relative "../lib/position"
require_relative "../lib/commands/place_command"
require_relative "../lib/commands/move_command"

RSpec.describe Parser do
  let!(:input) { "PLACE 0,0,WEST" }
  let!(:parser) { Parser.new(height: 4, width: 4) }
  let!(:place) { "PLACE 2,2,NORTH" }

  describe "#parse" do
    context "#PLACE" do
      it "place command is wrong" do
        no_valid_input = "PLACE"

        expect do
          parser.parse(no_valid_input)
        end.to output("the command placed is wrong, Must be similar to: 'PLACE 0,0,NORTH'\n").to_stdout
      end

      it "place command is right" do
        expect(parser).to receive(:parse).with(input)
        parser.parse(input)
      end

      it "place command is right" do
        command = parser.parse(input)

        expect(command).to be_an_instance_of(Position)
        expect(command.x_axis).to eq (0)
        expect(command.y_axis).to eq (0)
        expect(command.direction).to eq ("WEST")
      end
    end

    context "#MOVE" do
      let(:input) { "MOVE" }

      it "is not placed and move command" do

        expect do
          parser.parse(input)
        end.to output("Please, place the robot.\n").to_stdout
      end

      it "is placed and move command" do
        parser.parse(place)
        command = parser.parse(input)

        expect(command).to be_an_instance_of(Position)
        expect(command.x_axis).to eq (2)
        expect(command.y_axis).to eq (3)
        expect(command.direction).to eq ("NORTH")
      end
    end

    context "#LEFT" do
      let(:input) { "LEFT" }

      it "is not placed and left command" do
        expect do
          parser.parse(input)
        end.to output("Please, place the robot.\n").to_stdout
      end

      it "is placed and left command" do
        parser.parse(place)
        command = parser.parse(input)

        expect(command).to be_an_instance_of(Position)
        expect(command.x_axis).to eq (2)
        expect(command.y_axis).to eq (2)
        expect(command.direction).to eq ("WEST")
      end
    end

      context "#RIGHT" do
        let(:input) { "RIGHT" }

        it "is not placed and right command" do
          expect do
            parser.parse(input)
          end.to output("Please, place the robot.\n").to_stdout
        end

        it "is placed and right command" do
          parser.parse(place)
          command = parser.parse(input)

          expect(command).to be_an_instance_of(Position)
          expect(command.x_axis).to eq (2)
          expect(command.y_axis).to eq (2)
          expect(command.direction).to eq ("EAST")
        end
      end

      context "#REPORT" do
        let(:input) { "REPORT" }

        it "is not placed and report command" do
          expect do
            parser.parse(input)
          end.to output("Robot is not placed.\n").to_stdout
        end

        it "is placed and report command" do
          parser.parse(place)

          expect do
            parser.parse(input)
          end.to output("2,2,NORTH\n").to_stdout
        end
      end

      context "#BOARD" do
        it "is placed and board command" do
          input = "BOARD"

          parser.parse(place)

          expect do
            parser.parse(input)
          end.to output("board size is 4 x 4\n").to_stdout
        end
      end
  end
end
