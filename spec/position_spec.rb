require "spec_helper"
require_relative "../lib/position"

RSpec.describe Position do
  describe "#turn_left" do
    it "when facing NORTH go WEST" do
      position = Position.new(x_axis: 1, y_axis: 2, direction: "NORTH")

      expect(position.turn_left(position.direction)).to eq("WEST")
    end

    it "when facing WEST go SOUTH" do
      position = Position.new(x_axis: 1, y_axis: 2, direction: "WEST")

      expect(position.turn_left(position.direction)).to eq("SOUTH")
    end

    it "when facing SOUTH go EAST" do
      position = Position.new(x_axis: 1, y_axis: 2, direction: "SOUTH")

      expect(position.turn_left(position.direction)).to eq("EAST")
    end

    it "when facing EAST go NORTH" do
      position = Position.new(x_axis: 1, y_axis: 2, direction: "EAST")

      expect(position.turn_left(position.direction)).to eq("NORTH")
    end
  end

  describe "#turn_right" do
    it "when facing NORTH go EAST" do
      position = Position.new(x_axis: 1, y_axis: 2, direction: "NORTH")

      expect(position.turn_right(position.direction)).to eq("EAST")
    end

    it "when facing EAST go SOUTH" do
      position = Position.new(x_axis: 1, y_axis: 2, direction: "EAST")

      expect(position.turn_right(position.direction)).to eq("SOUTH")
    end

    it "when facing SOUTH go WEST" do
      position = Position.new(x_axis: 1, y_axis: 2, direction: "SOUTH")

      expect(position.turn_right(position.direction)).to eq("WEST")
    end

    it "when facing WEST go NORTH" do
      position = Position.new(x_axis: 1, y_axis: 2, direction: "WEST")

      expect(position.turn_right(position.direction)).to eq("NORTH")
    end
  end

  describe "#go_to" do
    it "goes NORTH" do
      position = Position.new(x_axis: 0, y_axis: 0, direction: "NORTH")
      new_position = position.go_to(position.direction)

      expect(new_position.x_axis).to eq(0)
      expect(new_position.y_axis).to eq(1)
      expect(new_position.direction).to eq("NORTH")
    end

    it "goes WEST" do
      position = Position.new(x_axis: 1, y_axis: 1, direction: "WEST")
      new_position = position.go_to(position.direction)

      expect(new_position.x_axis).to eq(0)
      expect(new_position.y_axis).to eq(1)
      expect(new_position.direction).to eq("WEST")
    end

    it "goes SOUTH" do
      position = Position.new(x_axis: 3, y_axis: 3, direction: "SOUTH")
      new_position = position.go_to(position.direction)

      expect(new_position.x_axis).to eq(3)
      expect(new_position.y_axis).to eq(2)
      expect(new_position.direction).to eq("SOUTH")
    end

    it "goes EAST" do
      position = Position.new(x_axis: 3, y_axis: 3, direction: "EAST")
      new_position = position.go_to(position.direction)

      expect(new_position.x_axis).to eq(4)
      expect(new_position.y_axis).to eq(3)
      expect(new_position.direction).to eq("EAST")
    end
  end
end