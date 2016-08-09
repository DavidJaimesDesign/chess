module Chess
	class Knight < Piece
		def display
			if self.color == "white"
				"\u2658".encode('utf-8')
			elsif self.color == "black"
				"\u265E".encode('utf-8')
			end 
		end
	end
end