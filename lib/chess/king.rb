module Chess
	class King < Piece
		def display
			if self.color == "white"
				"\u2654".encode('utf-8')
			elsif self.color == "black"
				"\u265A".encode('utf-8')
			end 
		end
	end
end