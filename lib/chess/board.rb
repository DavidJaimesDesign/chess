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
			empty_white = " "
			empty_black = " " 
			puts "this is blue".colorize(:black)
		end
	end
end