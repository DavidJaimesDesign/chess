module Chess
	class End_Game
		attr_accessor :king, :board, :king_coord
		def initialize(king, board, king_coord)
			@king 		= king
			@board 		= board
			@king_coord = king_coord
		end

		def check?
			if self.knight_check?
				true
			elsif self.horiz_check?
				true
			elsif self.vert_check?
				true
			elsif self.diagonal_check?
				true
			else
				false
			end
		end

		def knight_check?
			x = king_coord[1]
			y = king_coord[0]
			#pair 1 = y +\- 2 && x +\- 1
			#pair 2 = y +\- 1 && x +\- 2
			
			if  @board.board[y+2][x+1] != nil
				if @board.board[y+2][x+1].instance_of? Knight
					if @board.board[y+2][x+1].color != @king.color
						true
					else
						false
					end
				else
					false
				end

			elsif @board.board[y+2][x-1] != nil
				if @board.board[y+2][x-1].instance_of? Knight
					if @board.board[y+2][x-1].color != @king.color
						true
					else
						false
					end
				else
					false
				end

			elsif @board.board[y-2][x+1] != nil
				if @board.board[y-2][x+1].instance_of? Knight
					if @board.board[y-2][x+1].color != @king.color
						true
					else
						false
					end
				else
					false
				end

			elsif @board.board[y-2][x-1] != nil
				if @board.board[y-2][x-1].instance_of? Knight
					if @board.board[y-2][x-1].color != @king.color
						true
					else
						false
					end
				else
					false
				end

			elsif @board.board[y+1][x+1] != nil
				if @board.board[y+1][x+1] .instance_of? Knight
					if @board.board[y+1][x+1] .color != @king.color
						true
					else
						false
					end
				else
					false
				end

			elsif @board.board[y+1][x-1] != nil
				if @board.board[y+1][x-1].instance_of? Knight
					if @board.board[y+1][x-1].color != @king.color
						true
					else
						false
					end
				else
					false
				end

			elsif @board.board[y-1][x+1] != nil
				if @board.board[y-1][x+1].instance_of? Knight
					if @board.board[y-1][x+1].color != @king.color
						true
					else
						false
					end
				else
					false
				end

			elsif @board.board[y-1][x-1] != nil
				if @board.board[y-1][x-1].instance_of? Knight
					if @board.board[y-1][x-1].color != @king.color
						true
					else
						false
					end
				else
					false
				end

			else
				false
			end
		end
		
		def horiz_check?
			x = king_coord[1]
			y = king_coord[0]
			
			else
				false
			end
		end

		def vert_check?
			true
		end

		def diagonal_check?
			true
		end

		def pawn_check?
			true
		end
	end
end