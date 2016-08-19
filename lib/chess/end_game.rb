module Chess
	class End_Game
		attr_accessor :king, :board, :king_coord
		def initialize(king, board, king_coord)
			@king 		= king
			@board 		= board
			@king_coord = king_coord
		end

		def check?
			@board.board.each_with_index do |row, r_index|
				row.each_with_index do |cell, c_index|
					coord_i = [r_index, c_index]
					#puts coord_i.inspect
					if cell != nil && cell.color != @king.color && coord_i != king_coord && cell.valid_move?(coord_i, king_coord, @board) 
						return true
					else 
						false
					end
				end
			end
			return false
		end
	end
end

		