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

		def veritcal_positive_move(coord_i, coord_f)
		end 

		def vertical_negative_move(coord_i, coord_f)
		end

		def horizontal_positive_move(coord_i, coord_f)
		end

		def horizontal_negative_move(coord_i, coord_f)
		end

		def right_up_diagonal_move(coord_i,coord_f)
		end

		def right_down_diagonal_move(coord_i,coord_f)
		end

		def left_up_diagonal_move(coord_i, coord_f)
		end

		def left_down_diagonal_move(coord_i,coord_f)
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
