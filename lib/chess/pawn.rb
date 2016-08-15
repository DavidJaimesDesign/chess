module Chess
	#coord are [y , x]
	class Pawn < Piece
		def display
			if self.color == "white"
				"\u2659".encode('utf-8')
			elsif self.color == "black"
				"\u265F".encode('utf-8')
			end
		end

		def valid_move?(coord_i, coord_f, board)
			if coord_f[0] - coord_i[0] == 1 && coord_i[1] == coord_f[1]
				if board.board[coord_f[0]][coord_f[1]].nil?
					true
				else
					false
				end
			elsif coord_f[0] - coord_i[0] == 1 && (coord_f[1] - coord_i[1] == 1 || coord_f[1] - coord_i[1] == -1)
				if board.select_piece(coord_f[0], coord_f[1]).color != self.color
					true
				else
					false
				end
			else
				false 
			end
		end
	end
end