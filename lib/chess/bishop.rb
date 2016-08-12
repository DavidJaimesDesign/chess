module Chess
	class Bishop < Piece
		def display
			if self.color == "white"
				"\u2657".encode('utf-8')
			elsif self.color == "black"
				"\u265D".encode('utf-8')
			end 
		end

		def piece_jump_recur(coord_i, coord_f, board)
			return true if coord_f == coord_i
			if self.right_down_diagonal_move(coord_i,coord_f)
				x = coord_i[1] + 1
				y = coord_i[0] - 1

				if board.board[y][x].nil?
					coord_i = [y, x]
					piece_jump_recur(coord_i, coord_f, board)
				else 
					false
				end

			elsif self.right_up_diagonal_move(coord_i,coord_f)
				x = coord_i[1] + 1
				y = coord_i[0] + 1

				if board.board[y][x].nil?
					coord_i = [y, x]
					piece_jump_recur(coord_i, coord_f, board)
				else 
					false
				end

			elsif self.left_up_diagonal_move(coord_i, coord_f)
				x = coord_i[1] - 1
				y = coord_i[0] + 1

				if board.board[y][x].nil?
					coord_i = [y, x]
					piece_jump_recur(coord_i, coord_f, board)
				else 
					false
				end

			elsif self.left_down_diagonal_move(coord_i,coord_f)
				x = coord_i[1] - 1
				y = coord_i[0] - 1

				if board.board[y][x].nil?
					coord_i = [y, x]
					piece_jump_recur(coord_i, coord_f, board)
				else 
					false
				end
			end
		end

		def valid_move?(coord_i, coord_f, board)
			return "ERROR coordinates are nil" if coord_i.nil? || coord_f.nil?
			if team_kill?(coord_f, board)
				false
			elsif coord_i[0] == coord_f[0] || coord_i[1] == coord_f[1]
				false
			elsif self.piece_jump_recur(coord_i, coord_f, board)
				true
			else
				false
			end
		end
	end
end