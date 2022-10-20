$LOAD_PATH.unshift(File.dirname(__FILE__))

require "lib/parser"
require "lib/board"
require "lib/robot"
require "lib/position"

puts "Welcome to Robot!"
puts "Refer to the readme file for instructions."
puts "Plase use a valid commands"
puts "RIGHT, LEFT, MOVE, REPORT, and EXIT or q (to quit)"
puts "BOARD to see the size of the board."

puts "\n\n\n ==> Add the size of the board, please?, by default will be 5x5 <=="
puts "--------------------------------------------------------------------------"
puts "\n ==> Height: <=="
board_size_height = gets.chomp

if board_size_height.to_i < 0
  puts "height must be bigger than 0"
  exit!
elsif board_size_height.to_i == 0
  board_size_height = 4
end
puts "-------------------------------------------------"
puts "\n ==> Width: <=="

board_size_width = gets.chomp

if board_size_width.to_i < 0
  puts "width must be bigger than 0"
  exit!
elsif board_size_width.to_i == 0
  board_size_width = 4
end

playing = Parser.new(height: board_size_height.to_i, width: board_size_width.to_i)

loop do
  puts "\n\n\n ==> Type a new command: <=="
  input = gets.chomp
  command = playing.parse(input)
end
