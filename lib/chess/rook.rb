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
		end
	end
end