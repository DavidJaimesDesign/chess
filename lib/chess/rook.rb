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
			return "ERROR nil values for coords" if coord_i.nil? || coord_f.nil? 
			if team_kill?(coord_f, board)
				false
			elsif coord_i[1] == coord_f[1]
				#vertical movement checking for jumping over pieces
				if coord_i[0] < coord_f[0]
					i = coord_i[0] + 1
					while i < coord_f[0] do
						if board.board[i][coord_i[1]] != nil
							return false
						end
						i += 1
					end
					return true
				elsif coord_f[0] < coord_i[0]
					i = coord_f[0] + 1
					while i < coord_i[0] do
						if board.board[i][coord_i[1]] != nil
							return false
						end
						i += 1
					end
					return true
				end	
			elsif coord_i[0] == coord_f[0]
				#horizontal movement checking for jumping over pieces 
				row = coord_i[0]

				if coord_i[1] < coord_f[1]
					ci = coord_i[1] + 1
					cf = coord_f[1] - 1
					if board.board[row][ci..cf].any?
						false
					else
						if board.board[row][coord_f[1]].nil? 
							true
						elsif board.board[row][coord_f[1]].color == self.color
							false
						else
							true 
						end 
					end
				elsif coord_f[1] < coord_i[1]
					ci = coord_f[1] + 1
					cf = coord_i[1] - 1
					if board.board[row][ci..cf].any?
						false
					else
						if board.board[row][coord_f[1]].nil?
							true
						elsif board.board[row][coord_f[1]].color == self.color
							false
						else 
							true
						end
					end
				end	
			else
				false
			end
		end
	end
end 