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

		def new_game 
			
		end

		def display
			empty_white = "\u2587".encode('utf-8').colorize(:white) 
			empty_black = "\u2587".encode('utf-8').colorize(:light_black)

			display_board = board.each_with_index.map do |row, index|
				if index % 2 == 0
					row.each_with_index.map do |cell, index|
						if cell.nil? && index % 2 == 0
							cell = empty_white

						elsif cell.nil? && index % 2 == 1
							cell = empty_black
						end
					end
				elsif index % 2 == 1
					row.each_with_index.map do |cell, index|
						if cell.nil? && index % 2 == 0
							cell = empty_black

						elsif cell.nil? && index % 2 == 1
							cell = empty_white
						end
					end				
				end
			end
			display_board.each do |row|
				row.each{|cell| print "#{cell} " }
				print "\n"
			end 
		end
	end
end