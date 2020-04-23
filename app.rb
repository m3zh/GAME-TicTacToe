$:.unshift File.expand_path("./../lib",__FILE__)

require 'app/Player'
require 'app/Game'
require 'app/Board'
require 'views/Application'
#require 'views/Show'
require 'colorize'

while true
  puts "Player 1, your name:".center(60).yellow
  p1_name = gets.chomp #p1 -> player1
  p1 = Player.new(p1_name)

  puts "Player 2, your name:".center(60).yellow
  p2_name = gets.chomp #p2 -> player2
  p2 = Player.new(p2_name)

  game = Game.new(p1,p2)
#game.x_or_o?

  board = Board.new
  board.show_state

  puts "The board has three rows A,B,C".center(60)
  puts "and three columns 1,2,3".center(60)
  puts "Complete a row, column or diagonal to win".center(60)
  puts "Select where to place your pawn writing A1,C3 and the alike".center(55)

  app = Application.new(game,board)
  app.loop_until_exit

  puts "---------------".center(60)
  puts "Wanna play again?".center(60).yellow
  puts "Press Enter to play again".center(60).yellow
  puts "Press q to exit".center(60).yellow
  puts "---------------".center(60)
  choice = gets.chomp
  case choice
    when 'q'
      exit
    else
      redo
  end
end
