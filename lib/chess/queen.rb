module Chess
	class Queen < Piece
		def display
			if self.color == "white"
				"\u2655".encode('utf-8')
			elsif self.color == "black"
				"\u265B".encode('utf-8')
			end 
		end

		def valid_move?(coord_i, coord_f, board)
			return "ERROR coordinates are nil" if coord_i.nil? || coord_f.nil?
			if team_kill?(coord_f, board)
				false
			end
		end
	end
end