module Chess
	class Game 
		attr_accessor :board, :player1, :player2

		def initialize(player1, player2)
			@player1 = player1
			@player2 = player2 
			@board = Board.new
			@board.new_game
		end

		def coordinate_parser(coord)
			y = nil
			x = nil
			coord.split(//)
			if coord[0] == 'a'
				x = 0
			elsif coord[0] == 'b'
				x = 1
			elsif coord[0] == 'c'
				x = 2
			elsif coord[0] == 'd'
				x = 3
			elsif coord[0] == 'e'
				x = 4
			elsif coord[0] == 'f'
				x = 5
			elsif coord[0] == 'g'
				x = 6
			elsif coord[0] == 'h'
				x = 7
			else
				puts "ERROR invalid coordinates"
			end
			y = coord[1].to_i

			standard_coordinates = [y, x]
			return standard_coordinates
		end
	end
end
