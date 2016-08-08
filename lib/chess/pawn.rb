module Chess
	class Pawn < Piece
		def display
			if self.color == "white"
				"\u2659".encode('utf-8')
			elsif self.color == "black"
				"\u265F".encode('utf-8')
			end
		end

		def valid_move?(coord, board)
			#returns if the coordinates are a valid move for the pawn to make
		end
	end
end