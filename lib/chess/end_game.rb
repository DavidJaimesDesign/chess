module Chess
	class End_Game
		attr_accessor :king, :board, :king_coord 
		def initialize(king, board, king_coord)
			@king 		= king
			@board 		= board
			@king_coord = king_coord
		end

		def check?
			@board.board.each_with_index do |row, r_index|
				row.each_with_index do |cell, c_index|
					coord_i = [r_index, c_index]
					#puts coord_i.inspect
					if cell != nil && cell.color != @king.color && coord_i != king_coord && cell.valid_move?(coord_i, king_coord, @board) 
						return true
					else 
						false
					end
				end
			end
			return false
		end

		def check_piece?
			@board.board.each_with_index do |row, r_index|
				row.each_with_index do |cell, c_index|
					coord_i = [r_index, c_index]
					#puts coord_i.inspect
					if cell != nil && cell.color != @king.color && coord_i != king_coord && cell.valid_move?(coord_i, king_coord, @board) 
						return cell
					else 
						false
					end
				end
			end
			return false
		end

		def check_piece_coordinates?
			@board.board.each_with_index do |row, r_index|
				row.each_with_index do |cell, c_index|
					coord_i = [r_index, c_index]
					#puts coord_i.inspect
					if cell != nil && cell.color != @king.color && coord_i != king_coord && cell.valid_move?(coord_i, king_coord, @board) 
						return [r_index, c_index]
					else 
						nil
					end
				end
			end
			return nil
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
