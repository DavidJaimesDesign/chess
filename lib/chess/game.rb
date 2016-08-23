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

		def pawn_promote?
			board.board[0].each do |cell|
				if (cell.instance_of? Pawn) && cell.color == "white" 
					return true
				end
			end

			board.board[7].each do |cell|
				if (cell.instance_of? Pawn) && cell.color == "black" 
					return true
				end
			end

			false
		end

		def pawn_promotion(pawn_coord)
			y = pawn_coord[0]
			x = pawn_coord[1]

			puts "Your pawn can be promoted!"
			puts "What do you want to promote your pawn to?"
			puts "Queen"
			puts "Rook"
			puts "Bishop"
			puts "Knight"
			promote_to = gets.chomp

			if promote_to == "Queen"
			elsif promote_to == "Rook"
			elsif promote_to == "Bishop"
			elsif promote_to == "Knight"
			else
			end		
		end
	end
end
