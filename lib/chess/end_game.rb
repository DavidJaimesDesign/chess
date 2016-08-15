module Chess
	class End_Game
		attr_accessor :king, :board
		def initialize(king, board)
			@king = king
			@board = board
		end

		def check?
			if self.kight_check?
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

		def kight_check?
			true
		end

		def horiz_check?
			true
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