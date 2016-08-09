module Chess
	class Rook < Piece
		def display
			if self.color == "white"
				"\u2656".encode('utf-8')
			elsif self.color == "black"
				"\u265C".encode('utf-8')
			end
		end

		def valid_move?(coord_i, coord_f, board)
			if coord_i[1] == coord_f[1]
				#vertical movement

			elsif coord_i[0] == coord_f[0]
				#horizontal movement
				row = coord_i[0]
				if board.board[row][coord_i[1]..coord_f[1]].any?
					false 
				else
					true
			else
				false
			end
		end
	end
end