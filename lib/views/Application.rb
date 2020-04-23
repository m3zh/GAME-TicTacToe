require 'colorize'

class Application
  attr_reader :game, :board, :p1, :p2

  def initialize(game,board)
    @game = game
    @board = board
    @p1 = game.player1
    @p2 = game.player2
  end

  def loop_until_exit
    puts "---------------".center(60)
    puts "#{@p1.name} gets X, #{@p2.name} gets O".center(60).red
    puts "LET'S PLAY".center(60).red.blink
    puts "---------------".center(60)
    while game.is_over?(board.matrix,'X') == false && game.is_over?(board.matrix,'O') == false
      p1_move = @p1.select_move
      board.place_pawn(p1_move,'X')
      board.show_state
      break if game.is_over?(board.matrix,'X')
      puts ""
      p2_move = @p2.select_move
      board.place_pawn(p2_move,'O')
      board.show_state
      break if game.is_over?(board.matrix,'O')
      puts ""
    end
  end

end
