module Chess
	class End_Game
		attr_accessor :king, :board, :king_coord
		def initialize(king, board, king_coord)
			@king 		= king
			@board 		= board
			@king_coord = king_coord
		end

		def check?
		end

		