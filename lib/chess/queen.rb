module Chess
	class Queen < Piece
		def display
			if self.color == "white"
				"\u2655".encode('utf-8')
			elsif self.color == "black"
				"\u265B".encode('utf-8')
			end 
		end
	end
end