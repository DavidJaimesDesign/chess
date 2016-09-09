module Chess
	class End_Game
		attr_reader :king, :board, :king_coord, :king_coord_c, :king_coord_cp, :king_coord_cpc
		def initialize(king, board, king_coord)
			@king 		    = king
			@board 		    = board
			@king_coord     = king_coord
			@king_coord_cp  = king_coord
			@king_coord_c   = king_coord
			@king_coord_cpc = king_coord
		end

		def check?
			board_c = board
			king_c = king

			board_c.board.each_with_index do |row, r_index|
				row.each_with_index do |cell, c_index|
					coord_i = [r_index, c_index]
					#puts coord_i.inspect
					if cell != nil && cell.color != king_c.color && coord_i != king_coord_c && cell.valid_move?(coord_i, king_coord_c, board_c) 
						return true
					else 
						false
					end
				end
			end
			return false
		end

		def check_piece?
			board_c = board
			king_c = king

			board_c.board.each_with_index do |row, r_index|
				row.each_with_index do |cell, c_index|
					coord_i = [r_index, c_index]
					#puts coord_i.inspect
					if cell != nil && cell.color != king_c.color && coord_i != king_coord_cp && cell.valid_move?(coord_i, king_coord_cp, board_c) 
						return cell
					else 
						false
					end
				end
			end
			return false
		end

		def check_piece_coordinates?
			board_c = board
			king_c = king

			board_c.board.each_with_index do |row, r_index|
				row.each_with_index do |cell, c_index|
					coord_i = [r_index, c_index]
					#puts coord_i.inspect
					if cell != nil && cell.color != king_c.color && coord_i != king_coord_cpc && cell.valid_move?(coord_i, king_coord_cpc, board_c) 
						return [r_index, c_index]
					else 
						nil
					end
				end
			end
			return nil
		end

		def check_piece_intercept_array?
			check_piece  = self.check_piece?
			check_piece_coord = self.check_piece_coordinates?

			check_piece_intercept_array = []
			#FOR SOME UNKNOWN REASON BOTH CHECK_PIECE_COORIDNATES AND CHECK_PIECE INCREASE THE KING COORD Y AND X BY ONE ONLY ON DIAGONAL CHECKS WTAF
			king_coord_x = self.king_coord_refresh
			dy = check_piece_coord[0] - king_coord_x[0]
			dx = check_piece_coord[1] - king_coord_x[1]
			#this is a bandaid on a bug I could not even start to look for

			puts check_piece_coord.inspect
			puts king_coord.inspect

			if check_piece.instance_of? Knight
				return nil
			elsif dx == 0 
				#vertical
				if dy < 0
					return "shoe"
				elsif dy > 0
					return "blah"
				end
			end
		end

		def king_coord_refresh 
			board_c = board
			king_c = king
			king_coord_c = king_coord

			board_c.board.each_with_index do |row, r_index|
				row.each_with_index do |cell, c_index|
					coord_i = [r_index, c_index]
					#puts coord_i.inspect
					if cell == king 
						return [r_index, c_index]
					else 
						"ERROR no king"
					end
				end
			end
			return "ERROR no king"
		end 
		
		def king_move_escape?
			#false if all possible moves are still check mate but are valid
			#false if all possible moves are invalid
			#false if all possible moves still check or all possible moves are invalid
			king_possible_moves = self.king_possible_moves
			if self.king_no_move_valid? || self.king_all_move_check?
				false
			else
				true
			end
		end

		def king_no_move_valid?
			king_possible_moves = self.king_possible_moves
			if king_possible_moves.any?{|move| @king.valid_move?(@king_coord, move, @board)} 
				false
			else
				true
			end
		end

		def king_all_move_check?
			king_possible_moves = self.king_possible_moves
			still_check = []
			test_king = @king
			test_board = @board
			test_king_coord = @king_coord

			king_possible_moves.each do |move|

				test_board.board[test_king_coord[0]][test_king_coord[1]] = nil
				test_board.board[move[0]][move[1]] = test_king
				still_check_game = End_Game.new(test_king, test_board, move)
				test_board.board[move[0]][move[1]] = nil
				still_check << 1 if still_check_game.check?
			end
			
			if still_check.length == king_possible_moves.length
				true
			else
				false
			end
		end

		def king_possible_moves
			king_possible_moves = Array.new
			y  = king_coord[0]
			y1 = king_coord[0] + 1
			y2 = king_coord[0] - 1
			x  = king_coord[1]
			x1 = king_coord[1] + 1
			x2 = king_coord[1] - 1

			y1 = y if y1 > 7 
			y2 = y if y2 < 0
			x1 = x if x1 > 7 
			x2 = x if x2 < 0

			king_possible_moves = [[y1, x2],[y1, x],[y1, x1],[y, x2],[y, x1],[y2, x2],[y2, x],[y2, x1]]
			king_possible_moves = king_possible_moves.uniq
			return king_possible_moves
		end

		def any_capture_check_piece?
			check_piece_coord = self.check_piece_coordinates?

			@board.board.each_with_index do |row, r_index|
				row.each_with_index do |cell, c_index|
					coord_i = [r_index, c_index]
					#puts coord_i.inspect
					if cell != nil && cell.color == @king.color && coord_i != king_coord && cell.valid_move?(coord_i, check_piece_coord, @board) 
						return true
					else 
						false
					end
				end
			end
			return false
		end

		def any_intercept_check_piece?
		end
	end
end
=begin
			a = 0
					b = king_coord[0] - 1
					while a > dy do
						check_piece_intercept_array << [b, king_coord[0]]
						b -= 1
						a -= 1
					end

			a = 0
					b = king_coord[0] + 1
					while a < dy do
						check_piece_intercept_array << [b, king_coord[0]]
						b += 1
						a += 1
					end


			if check_piece.instance_of? Knight
				return nil
			elsif dy == 0
				#horizontal
				if dx < 0
					a = 0
					b = king_coord[1] - 1
					while a > dx do
						check_piece_intercept_array << [king_coord[0], b]
						b -= 1
						a -= 1
					end
				elsif  dx > 0
					a = 0
					b = king_coord[1] + 1
					while a < dx do
						check_piece_intercept_array << [king_coord[0], b]
						b += 1
						a += 1
					end
				end
						
			elsif dx != 0 && dy != 0
				#diagonal
				if dy > 0 && dx > 0
					a = 0
					b = king_coord[0] + 1
					while a < dy do
						check_piece_intercept_array << [b, b]
						b += 1
						a += 1
					end
				elsif dy > 0 && dx < 0
					a = 0
					b = king_coord[0] + 1
					c = king_coord[1] - 1

					while a < dy do
						check_piece_intercept_array << [b, c]
						b += 1
						c -= 1
						a += 1
					end
				elsif dy < 0 && dx > 0
					a = 0
					b = king_coord[0] - 1
					c = king_coord[1] + 1

					while a > dy do
						check_piece_intercept_array << [b, c]
						b -= 1
						c += 1
						a -= 1
					end
				elsif dy < 0 && dx < 0	
					a = 0
					b = king_coord[0] - 1
					while a > dy do
						check_piece_intercept_array << [b, b]
						b -= 1
						a -= 1
					end
				end
				return check_piece_intercept_array
			end
=end
