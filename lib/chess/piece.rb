module Chess
	class Piece
		attr_reader :color
		attr_accessor :count
		def initialize(color, count = 0)
			@count = count
			@color = color
		end

		def move(coord_i, coord_f, board)
			board.board[coord_f[0]][coord_f[1]] = self
			board.board[coord_i[0]][coord_i[1]] = nil
			self.count += 1
		end

		def vertical_positive_move(coord_i, coord_f)
			if coord_f[0] > coord_i[0] && coord_i[1] == coord_f[1]
				true
			else 
				false
			end
		end 

		def vertical_negative_move(coord_i, coord_f)
			if coord_f[0] < coord_i[0] && coord_i[1] == coord_f[1]
				true
			else 
				false
			end
		end

		def horizontal_positive_move(coord_i, coord_f)
			if coord_f[0] == coord_i[0] && coord_f[1] > coord_i[1]
				true
			else
				false
			end
		end

		def horizontal_negative_move(coord_i, coord_f)
			if coord_f[0] == coord_i[0] && coord_f[1] < coord_i[1]
				true
			else
				false
			end
		end

		def right_up_diagonal_move(coord_i,coord_f)
			slope = (coord_f[0] - coord_i[0])/(coord_f[1] - coord_i[1])

			if slope == 1 && coord_f[0] > coord_i[0] && coord_f[1] > coord_i[1]
				true
			else
				false
			end
		end

		def right_down_diagonal_move(coord_i,coord_f)
			slope = (coord_f[0] - coord_i[0])/(coord_f[1] - coord_i[1])

			if slope == -1 && coord_f[0] < coord_i[0] && coord_f[1] > coord_i[1]
				true
			else
				false
			end
		end

		def left_up_diagonal_move(coord_i, coord_f)
			slope = (coord_f[0] - coord_i[0])/(coord_f[1] - coord_i[1])

			if slope == -1 && coord_f[0] > coord_i[0] && coord_f[1] < coord_i[1]
				true
			else
				false
			end
		end

		def left_down_diagonal_move(coord_i,coord_f)
			slope = (coord_f[0] - coord_i[0])/(coord_f[1] - coord_i[1])

			if slope == 1 && coord_f[0] < coord_i[0] && coord_f[1] < coord_i[1]
				true
			else
				false
			end
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
