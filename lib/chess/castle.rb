module Chess
	class Castle
		attr_accessor :board

		def initialize(board)
			if board.instance_of? Board
				@board = board 
			else 
				puts "ERROR not a chess game board"
			end
		end

		def white_king_side_castle
			if @board.board[7][1].nil? && @board.board[7][2].nil?
				if @board.board[7][3].count == 0 && @board.board[7][0].count == 0
					no_check = End_Game.new(@board.board[7][3],@board, [7, 3])
					if no_check.check? 
						false
					else
						true
					end
				else
					false
				end
			else
				false
			end
		end

		def white_queen_side_castle
			if  @board.board[7][6].nil? && @board.board[7][5].nil? && @board.board[7][4].nil?
				if @board.board[7][3].count == 0 && @board.board[7][7].count == 0
					no_check = End_Game.new(@board.board[7][3],@board, [7, 3])
					if no_check.check? 
						false
					else
						true
					end
				else
					false
				end
			else
				false
			end
		end

	end
end

=begin
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