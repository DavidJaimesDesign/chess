module Chess
	class Piece
		attr_reader :color
		def initialize(color)
			@color = color
		end

		def move(coord, board)
		end

		def capture(coord, board)
		end

		def delete
			self = nil
		end
	end
end
