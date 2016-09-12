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

			@board[6][0] = Pawn.new("white")
			@board[6][1] = Pawn.new("white")
			@board[6][2] = Pawn.new("white")
			@board[6][3] = Pawn.new("white")
			@board[6][4] = Pawn.new("white")
			@board[6][5] = Pawn.new("white")
			@board[6][6] = Pawn.new("white")
			@board[6][7] = Pawn.new("white")


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

			@board[0][4] = Queen.new("black")
			@board[7][4] = Queen.new("white")
			
			@board[0][3] = King.new("black")
			@board[7][3] = King.new("white")
		end

		def display #test for a movement bug in white knights and bishops
			empty_white  = "\u25A0".encode('utf-8').colorize(:white) 
			empty_black  = "\u25A0".encode('utf-8').colorize(:light_black)
			white_pawn   = "\u2659".encode('utf-8').colorize(:white)
			white_knight = "\u2658".encode('utf-8').colorize(:white)
			white_bishop = "\u2657".encode('utf-8').colorize(:white)
			white_rook   = "\u2656".encode('utf-8').colorize(:white)
			white_queen  = "\u2655".encode('utf-8').colorize(:white)
			white_king   = "\u2654".encode('utf-8').colorize(:white)
			black_pawn   = "\u265F".encode('utf-8').colorize(:light_black)
			black_knight = "\u265E".encode('utf-8').colorize(:light_black)
			black_bishop = "\u265D".encode('utf-8').colorize(:light_black)
			black_rook   = "\u265C".encode('utf-8').colorize(:light_black)
			black_queen  = "\u265B".encode('utf-8').colorize(:light_black)
			black_king   = "\u265A".encode('utf-8').colorize(:light_black)

			puts "   a b c d e f g h"
			display_board = board.each_with_index.map do |row, index|
				if index % 2 == 0
					row.each_with_index.map do |cell, index|
						if cell.nil? && index % 2 == 0
							cell = empty_white

						elsif cell.nil? && index % 2 == 1
							cell = empty_black

						elsif cell.instance_of? Pawn
							if cell.color    == "black"
								cell = black_pawn
							elsif cell.color == "white"
								cell = white_pawn
							end			
						elsif cell.instance_of? Knight
							if cell.color    == "black"
								cell = black_knight
							elsif cell.color == "white"
								cell = white_knight
							end	
						elsif cell.instance_of? Bishop
							if cell.color    == "black"
								cell = black_bishop
							elsif cell.color == "white"
								cell = white_bishop
							end	
						elsif cell.instance_of? Rook
							if cell.color    == "black"
								cell = black_rook
							elsif cell.color == "white"
								cell = white_rook
							end	
						elsif cell.instance_of? Queen
							if cell.color    == "black"
								cell = black_queen
							elsif cell.color == "white"
								cell = white_queen
							end	
						elsif cell.instance_of? King
							if cell.color    == "black"
								cell = black_king
							elsif cell.color == "white"
								cell = white_king
							end	
						end
					end
				elsif index % 2 == 1
					row.each_with_index.map do |cell, index|
						if cell.nil? && index % 2 == 0
							cell = empty_black

						elsif cell.nil? && index % 2 == 1
							cell = empty_white
						elsif cell.instance_of? Pawn
							if cell.color    == "black"
								cell = black_pawn
							elsif cell.color == "white"
								cell = white_pawn
							end			
						elsif cell.instance_of? Knight
							if cell.color    == "black"
								cell = black_knight
							elsif cell.color == "white"
								cell = white_knight
							end	
						elsif cell.instance_of? Bishop
							if cell.color    == "black"
								cell = black_bishop
							elsif cell.color == "white"
								cell = white_bishop
							end	
						elsif cell.instance_of? Rook
							if cell.color    == "black"
								cell = black_rook
							elsif cell.color == "white"
								cell = white_rook
							end	
						elsif cell.instance_of? Queen
							if cell.color    == "black"
								cell = black_queen
							elsif cell.color == "white"
								cell = white_queen
							end	
						elsif cell.instance_of? King
							if cell.color    == "black"
								cell = black_king
							elsif cell.color == "white"
								cell = white_king
							end	
						end
					end				
				end
			end
			numbers = [" 8", " 7", " 6", " 5", " 4", " 3", " 2", " 1"]

			display_board.each_with_index do |row, index|
				print "#{numbers[index]}"
				row.each{|cell| print " #{cell}"}
				print "#{numbers[index]}\n"
			end 
			puts "   a b c d e f g h"
		end

		def select_piece(coord)
			@board[coord[0]][coord[1]]
		end

		def copy_board
			copy = Board.new
			@board.each_with_index do |row, r_index|
				row.each_with_index do |cell, c_index|
					if cell.instance_of? Pawn
						copy.board[r_index][c_index] = Pawn.new(cell.color)
					elsif cell.instance_of? King
						copy.board[r_index][c_index] = King.new(cell.color)
					elsif cell.instance_of? Queen
						copy.board[r_index][c_index] = Queen.new(cell.color)
					elsif cell.instance_of? Rook
						copy.board[r_index][c_index] = Rook.new(cell.color)
					elsif cell.instance_of? Knight
						copy.board[r_index][c_index] = Knight.new(cell.color)
					elsif cell.instance_of? Bishop
						copy.board[r_index][c_index] = Bishop.new(cell.color)
					end
				end
			end
			return copy
		end
	end
end