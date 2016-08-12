module Chess
	class Rook < Piece
		def display
			if self.color == "white"
				"\u2656".encode('utf-8')
			elsif self.color == "black"
				"\u265C".encode('utf-8')
			end
		end

		def piece_jump_recur(coord_i, coord_f, board)
			return true if coord_i == coord_f#problem might be here

			if self.vertical_positive_move(coord_i, coord_f)
				puts "a"
				x = coord_i[1]
				y = coord_i[0] + 1
				
				if board.board[y][x].nil?
					coord_i = [y, x]
					piece_jump_recur(coord_i, coord_f, board)
				else 
					true 
				end

			elsif self.vertical_negative_move(coord_i, coord_f)
				puts "b"
				x = coord_i[1]
				y = coord_i[0] - 1

				if board.board[y][x].nil?
					coord_i = [y, x]
					piece_jump_recur(coord_i, coord_f, board)
				end

			elsif self.horizontal_positive_move(coord_i, coord_f)#fix here and apply to other four
				puts "c"
				x = coord_i[1] + 1
				y = coord_i[0]

				if board.board[y][x].nil?
					coord_i = [y, x]
					piece_jump_recur(coord_i, coord_f, board)
				end

			elsif self.horizontal_negative_move(coord_i, coord_f)
				puts "d"
				x = coord_i[1] - 1
				y = coord_i[0]

				if board.board[y][x].nil?
					coord_i = [y, x]
					piece_jump_recur(coord_i, coord_f, board)
				end

			end
		end

		def valid_move?(coord_i, coord_f, board)
			return "ERROR nil values for coords" if coord_i.nil? || coord_f.nil? 
			if team_kill?(coord_f, board)
				false
			elsif self.piece_jump_recur(coord_i, coord_f, board)
				true
			else
				false
			end
		end
	end
end 