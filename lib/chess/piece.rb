module Chess
	class Piece
		attr_reader :color
		def initialize(color)
			@color = color
		end

		def move(coord_i, coord_f, board)
			board.board[coord_f[0]][coord_f[1]] = self
			board.board[coord_i[0]][coord_i[1]] = nil
		end

		def capture(coord, board)
		end 

		def team_kill?(coord_f, board)
			y = coord_f[0]
			x = coord_f[1]

			if board.board[y][x].nil?
				board.board[y][x]
			elsif board.board[coord_f[0]][coord_f[1]].color == self.color
				true
			else
				false
			end
		end
	end
end
