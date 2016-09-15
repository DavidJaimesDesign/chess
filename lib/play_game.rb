$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'chess'
puts"      _                  ".to_s 
puts"     | |                  ".to_s
puts"  ___| |__   ___  ___ ___ ".to_s
puts" / __| '_ \\ / _ \\/ __/ __|".to_s
puts"| (__| | | |  __/\\__ \\__ \\".to_s
puts" \\___|_| |_|\\___||___/___/".to_s
puts "Created by: David Jaimes"
puts "Pirates never die."
puts ""
puts ""
puts "This is a two player game you will need a friend or at least someone to play with you."
puts "Decide amongst the two of you who is going to be white and who is going to be black."
puts "Once you type and make a move it's final if you cannot make the move your turn is skipped"
puts "you have been warned"
puts ""
puts "Do you need the instructions? please enter y or n"
instructions = gets.chomp
if instructions == "y" 
	puts "For regular moves:"
	puts "	1.	Select the piece you want to move by inputing the letter then the number. "
	puts "	2.	Select the location you want the piece to move to by inputing the letter then the number."	
	puts "	note the game will warn you if your move is illegal"
	puts ""
	puts "Castling"
	puts "	1.	In the select prompt input the type of move you want to make"
	puts "		example: kings side castle will castle on the kings side"
	puts ""
	puts "		note the game will warn you if the move is illegal"	
	puts ""
	puts "	Here are the castling commands:"
	puts "		1.	king's side castle"
	puts "		2.	queen's side castle"
elsif instructions == "n"
	puts "Let's get this game started then"
else 
	puts "don't get fresh with me"
end
puts ""
puts "White please state your name:"
white = gets.chomp
puts "Black please state your name:"
black = gets.chomp
puts ""

game = Chess::Game.new(white, black)
game.board.display

test_checkmate = false
while  test_checkmate == false do
	puts "#{white} select a piece"
	piece_coord = gets.chomp
	piece_coord_std = game.coordinate_parser(piece_coord)
	piece = game.board.select_piece(piece_coord_std)
	puts piece.inspect

	puts "#{white} input a move"
	move_coord = gets.chomp
	if move_coord.length < 3	
		move_coord_std = game.coordinate_parser(move_coord)
		if piece.valid_move?(piece_coord_std, move_coord_std, game.board)
			piece.move(piece_coord_std, move_coord_std, game.board)
			if game.pawn_promote?
				game.pawn_promotion(move_coord_std)
			end
			game.board.display
		else
			puts "please add a valid move"
			puts ""
	    	game.board.display
		end
	end
	if move_coord == "king's side castle"
		castle = Chess::Castle.new(game.board)
		if castle.white_king_side_castle
			game.board.board[7][6] = game.board.board[7][3]
			game.board.board[7][5] = game.board.board[7][7]
			game.board.board[7][7] = nil
			game.board.board[7][3] = nil
			game.board.display
		else 
			puts "can't castle skip your turn"
		end
	elsif move_coord == "queen's side castle"
		castle = Chess::Castle.new(game.board)
		if castle.white_king_side_castle
			game.board.board[7][2] = game.board.board[7][3]
			game.board.board[7][3] = game.board.board[7][0]
			game.board.board[7][0] = nil
			game.board.board[7][3] = nil
			game.board.display
		else 
			puts "can't castle skip your turn"
		end
	end

	puts "#{black} select a piece"
	piece_coord = gets.chomp
	piece_coord_std = game.coordinate_parser(piece_coord)
	piece = game.board.select_piece(piece_coord_std)


	puts "#{black} input a move"
	move_coord = gets.chomp
	move_coord_std = game.coordinate_parser(move_coord)
	if move_coord.length < 3	
		move_coord_std = game.coordinate_parser(move_coord)
		if piece.valid_move?(piece_coord_std, move_coord_std, game.board)
			piece.move(piece_coord_std, move_coord_std, game.board)
			game.board.display
			if game.pawn_promote?
				game.pawn_promotion(move_coord_std)
			end
		else
			puts "please add a valid move"
			puts ""
	    	game.board.display
		end
	end	

	if move_coord == "king's side castle"
		castle = Chess::Castle.new(game.board)
		if castle.white_king_side_castle
			game.board.board[0][6] = game.board.board[0][3]
			game.board.board[0][5] = game.board.board[0][7]
			game.board.board[0][7] = nil
			game.board.board[0][3] = nil
			game.board.display
		else 
			puts "can't castle skip your turn"
		end
	elsif move_coord == "queen's side castle"
		castle = Chess::Castle.new(game.board)
		if castle.white_king_side_castle
			game.board.board[0][2] = game.board.board[0][3]
			game.board.board[0][3] = game.board.board[0][0]
			game.board.board[0][0] = nil
			game.board.board[0][3] = nil
			game.board.display
		else 
			puts "can't castle skip your turn"
		end
	end
end


