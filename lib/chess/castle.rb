module Chess
	class Castle
	end
end

=begin
def white_kings_side_castle
			if @board.board[7][1].nil? && @board.board[7][2].nil?
				if @board.board[7][3].count == 0 && @board.board[7][0].count == 0
					true
				else
					false
				end
			else
				false
			end
		end

		def white_queens_side_castle
			if  @board.board[7][6].nil? && @board.board[7][5].nil? && @board.board[7][4].nil?
				if @board.board[7][3].count == 0 && @board.board[7][7].count == 0
					true
				else
					false
				end
			else
				false
			end
		end

		def black_kings_side_castle
			if @board.board[0][1].nil? && @board.board[0][2].nil?
				if @board.board[0][3].count == 0 && @board.board[0][0].count == 0
					true
				else
					false
				end
			else
				false
			end
		end

		def black_queens_side_castle
			if  @board.board[0][6].nil? && @board.board[0][5].nil? && @board.board[0][4].nil?
				if @board.board[0][3].count == 0 && @board.board[0][7].count == 0
					true
				else
					false
				end
			else
				false
			end
		end
=end