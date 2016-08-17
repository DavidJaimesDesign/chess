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
		
		def right_check?
			x = king_coord[1]
			y = king_coord[0]
			
			x += 1

			while x <= 7 do
				if @board.board[y][x] != nil
					if @board.board[y][x].instance_of? Rook 
						if @board.board[y][x].color != @king.color
							return true
						else
							return	false
						end

					elsif @board.board[y][x].instance_of? Queen
						if @board.board[y][x].color != @king.color
							return true
						else
							return false
						end

					else 
						return	false
					end
				elsif x == 7
					return false
				else
					x += 1
				end
			end
		end

		def left_check?
			x = king_coord[1]
			y = king_coord[0]
			x -= 1

			while x >= 0 do
				if @board.board[y][x] != nil
					if @board.board[y][x].instance_of? Rook 
						if @board.board[y][x].color != @king.color
							return true
						else
							return	false
						end

					elsif @board.board[y][x].instance_of? Queen
						if @board.board[y][x].color != @king.color
							return true
						else
							return false
						end

					else 
						return	false
					end
				elsif x == 0
					return false
				else
					x -= 1
				end
			end
		end

		def pos_vert_check?
			x = king_coord[1]
			y = king_coord[0]
			y -= 1

			while y >= 0 do
				if @board.board[y][x] != nil
					if @board.board[y][x].instance_of? Rook 
						if @board.board[y][x].color != @king.color
							return true
						else
							return	false
						end

					elsif @board.board[y][x].instance_of? Queen
						if @board.board[y][x].color != @king.color
							return true
						else
							return false
						end

					else 
						return	false
					end
				elsif y == 0
					return false
				else
					y -= 1
				end
			end
		end

		def neg_vert_check?
			x = king_coord[1]
			y = king_coord[0]
			y += 1

			while y <= 7 do
				if @board.board[y][x] != nil
					if @board.board[y][x].instance_of? Rook 
						if @board.board[y][x].color != @king.color
							return true
						else
							return	false
						end

					elsif @board.board[y][x].instance_of? Queen
						if @board.board[y][x].color != @king.color
							return true
						else
							return false
						end

					else 
						return	false
					end
				elsif y == 7
					return false
				else
					y += 1
				end
			end
		end

		def vert_check?
			if self.pos_vert_check? || self.neg_vert_check?
				true
			else
				false
			end
		end

		def horiz_check?
			if self.right_check? || self.left_check?
				true
			else
				false
			end
		end
		
		def diagonal_check?
			true
		end

		def pawn_check?
			true
		end
	end
end