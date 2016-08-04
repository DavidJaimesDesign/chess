require 'colorize'
module Chess
	class Board
		attr_accessor :board
		def initialize
			@board = [nil,nil,nil,nil,nil,nil,nil,nil],
					 [nil,nil,nil,nil,nil,nil,nil,nil],
					 [nil,nil,nil,nil,nil,nil,nil,nil],
					 [nil,nil,nil,nil,nil,nil,nil,nil],
					 [nil,nil,nil,nil,nil,nil,nil,nil],
					 [nil,nil,nil,nil,nil,nil,nil,nil],
					 [nil,nil,nil,nil,nil,nil,nil,nil],
					 [nil,nil,nil,nil,nil,nil,nil,nil]
		end 

		def display
			empty_white = "\u25a1\u2659".encode('utf-8')
			empty_black = "\u25a0".encode('utf-8') 
			puts "#{empty_black}".colorize(:black)
			puts "#{empty_white}".colorize(:white)

			display_board = board.map do |row|
			end
		end
	end
end