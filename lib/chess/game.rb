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
				puts "Error invalid x coordinates"
			end
			
			if coord[1] == '8'
				y = 0
			elsif coord[1] == '7'
				y = 1
			elsif coord[1] == '6'
				y = 2
			elsif coord[1] == '5'
				y = 3
			elsif coord[1] == '4'
				y = 4
			elsif coord[1] == '3'
				y = 5
			elsif coord[1] == '2'
				y = 6
			elsif coord[1] == '1'
				y = 7
			else
				puts "Error invalid y coordinates"
			end
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

		def pawn_promotion(pawn_coord) #could not figure out how to test this one

			y = pawn_coord[0]
			x = pawn_coord[1]
			color = @board.board[y][x].color

			puts "Your pawn can be promoted!"
			puts "What do you want to promote your pawn to?"
			puts "Queen"
			puts "Rook"
			puts "Bishop"
			puts "Knight"
			promote_to = $stdin.gets.chomp
			
			if promote_to == "Queen"
				@board.board[y][x] = Queen.new(color)
			elsif promote_to == "Rook"
				@board.board[y][x] = Rook.new(color)
			elsif promote_to == "Bishop"
				@board.board[y][x] = Bishop.new(color)
			elsif promote_to == "Knight"
				@board.board[y][x] = Knight.new(color)
			else
				puts "Please input a valid pawn_promotion"
				pawn_promotion(pawn_coord)
			end		
		end
	end
end
