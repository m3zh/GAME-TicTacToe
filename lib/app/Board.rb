require 'colorize'
require 'colorized_string'

class Board
  attr_reader :matrix, :row1, :row2,:row3

  def initialize
    @row1 = [' ']*3
    @row2 = [' ']*3
    @row3 = [' ']*3
    @matrix = [@row1,@row2,@row3]
  end

  def show_state
      letters = ["1","2","3"]
      separator = ["-"]*12
      puts ""
      puts "   #{letters.join('   ')}".center(57).green
      puts "A  #{@row1.join(' | ')}".center(57).green
      puts "   #{separator.join()}".center(57).green
      puts "B  #{@row2.join(' | ')}".center(57).green
      puts "   #{separator.join()}".center(57).green
      puts "C  #{@row3.join(' | ')}".center(57).green
      puts ""
  end

  def place_pawn(player_choice,sign)
    col = player_choice[1].to_i - 1
    row = player_choice[0].upcase
    case row
      when "A"
         if @row1[col] == ' '
           @row1[col] = sign
         else
           puts "-----> Case already taken".red
         end
      when "B"
        if @row2[col] == ' '
          @row2[col] = sign
        else
          puts "------> Case already taken".red
        end
      when "C"
        if @row3[col] == ' '
          @row3[col] = sign
        else
          puts "-----> Case already taken".red
        end
      else
        if row.match?(/[ABC]/) == false || col > 2
          puts "-----> Wrong input, you'll miss a turn".red
        end
      end
    end

    def matrix
      return @matrix
    end

end
