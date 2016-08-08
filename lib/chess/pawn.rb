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
				true
			else
				false 
			end
		end
	end
end