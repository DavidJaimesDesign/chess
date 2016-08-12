module Chess
	class Bishop < Piece
		def display
			if self.color == "white"
				"\u2657".encode('utf-8')
			elsif self.color == "black"
				"\u265D".encode('utf-8')
			end 
		end

		def piece_jump_recur(coord_i, coord_f, board)
			return false if coord_f == coord_i
		end

		def valid_move?(coord_i, coord_f, board)
			return "ERROR coordinates are nil" if coord_i.nil? || coord_f.nil?
			if team_kill?(coord_f, board)
				false
			elsif coord_i[0] == coord_f[0] || coord_i[1] == coord_f[1]
				false
			end
		end
	end
end