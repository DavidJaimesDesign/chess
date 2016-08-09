module Chess
	class Bishop < Piece
		def display
			if self.color == "white"
				"\u2657".encode('utf-8')
			elsif self.color == "black"
				"\u265D".encode('utf-8')
			end 
		end
	end
end