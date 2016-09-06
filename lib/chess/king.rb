module Chess
	class King < Piece
		def display
			if self.color == "white"
				"\u2654".encode('utf-8')
			elsif self.color == "black"
				"\u265A".encode('utf-8')
			end 
		end

		def valid_move?(coord_i, coord_f, board)
			return "ERROR nil values for coords" if coord_i.nil? || coord_f.nil? 
			if team_kill?(coord_f, board)
				false
			elsif (coord_f[0] - coord_i[0] > 1) || (coord_f[1] - coord_i[1] > 1) ||  (coord_f[0] - coord_i[0] < -1)
				false
			else
				true
			end
		end
	end
end