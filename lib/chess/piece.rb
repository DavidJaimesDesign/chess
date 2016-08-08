module Chess
	class Piece
		attr_reader :color
		def initialize(color)
			@color = color
		end

		def move(coord_i, coord_f, board)
			board.board[coord_i[0]][coord_i[1]] = self
			board.board[coord_f[0]][coord_f[1]] = nil
		end

		def capture(coord, board)
		end
	end
end
