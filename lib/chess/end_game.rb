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

		def king_move_escape?
			king_possible_moves = self.king_possible_moves
			king_possible_moves.any? do |move|
				test_king  = @king
				test_board = @board

				test_board.board[king_coord[0]][king_coord[1]] = nil
				test_board.board[move[0]][move[1]] = test_king

				still_check = End_Game.new(@king,test_board, move)

				if @king.valid_move?(@king_coord, move, @board) && !still_check.check?
					true
				else 
					false
				end
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

			king_possible_moves = [[y1, x2],[y1, x],[y1, x1],[y, x2],[y, x1],[y2, x2],[y2, x],[y2, x1]]
			return king_possible_moves
		end
	end
end

		