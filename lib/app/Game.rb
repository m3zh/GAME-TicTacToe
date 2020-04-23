class Game
  attr_reader :player1, :player2, :pawn

  def initialize(p1,p2)
    @player1 = p1
    @player2 = p2
    #first_player = @player1
    #second_player = @player2
    @pawn = ["X","O"]
  end

  def is_over?(board,sign)
    seq = sign * 3
    col_1 = [board[0][0],board[1][0],board[2][0]]
    col_2 = [board[0][1],board[1][1],board[2][1]]
    col_3 = [board[0][2],board[1][2],board[2][2]]
    diagonal_1 = [board[0][0],board[1][1],board[2][2]]
    diagonal_2 = [board[0][2],board[1][1],board[2][0]]
    if board[0].join('') == seq || board[1].join('') == seq || board[2].join('') == seq ||
       col_1.join('') == seq || col_2.join('') == seq || col_3.join('') == seq ||
       diagonal_1.join('') == seq || diagonal_2.join('') == seq
      if seq.include?('X')
        puts "---------------".center(60).red
        puts "**** #{@player1.name.upcase} WON! ****".center(60).red.blink
        puts "---------------".center(60).red
        return true
      elsif seq.include?('O')
        puts "---------------".center(60).red
        puts "**** #{@player2.name.upcase} WON! ****".center(60).red.blink
        puts "---------------".center(60).red
        return true
      end
    elsif board[0].none?(" ") && board[1].none?(" ") && board[2].none?(" ")
        puts "---------------".center(60).blue
        puts "**** NO WINNER ****".center(60).blue
        puts "**** IT'S A TIE ****".center(60).blue
        puts "---------------".center(60).blue
        return true
    else
      return false
    end
  end
end
