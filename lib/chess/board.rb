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
			@board[1][0] = Pawn.new("black")
			@board[1][1] = Pawn.new("black")
			@board[1][2] = Pawn.new("black")
			@board[1][3] = Pawn.new("black")
			@board[1][4] = Pawn.new("black")
			@board[1][5] = Pawn.new("black")
			@board[1][6] = Pawn.new("black")
			@board[1][7] = Pawn.new("black")

			@board[6][0] = Pawn.new("black")
			@board[6][1] = Pawn.new("black")
			@board[6][2] = Pawn.new("black")
			@board[6][3] = Pawn.new("black")
			@board[6][4] = Pawn.new("black")
			@board[6][5] = Pawn.new("black")
			@board[6][6] = Pawn.new("black")
			@board[6][7] = Pawn.new("black")


			@board[0][0] = Rook.new("black")
			@board[0][7] = Rook.new("black")
			@board[7][7] = Rook.new("white")
			@board[7][0] = Rook.new("white")

			@board[0][1] = Knight.new("black")
			@board[0][6] = Knight.new("black")
			@board[7][1] = Knight.new("white")
			@board[7][6] = Knight.new("white")

			@board[0][2] = Bishop.new("black")
			@board[0][5] = Bishop.new("black")
			@board[7][2] = Bishop.new("white")
			@board[7][5] = Bishop.new("white")

			@board[0][4] = Queen.new("white")
			@board[7][4] = Queen.new("white")
			
			@board[0][3] = King.new("white")
			@board[7][3] = King.new("white")
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

		def select_piece(y, x)
			@board[y][x]
		end
	end
end