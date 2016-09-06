require 'spec_helper'
require 'stringio'

module Chess
	describe Game do
		context "#initialize" do
			before(:each) do
				player1 = "al"
				player2 = "bo"
				@game = Game.new(player1, player2)
			end
			it "takes the two players" do
				expect(@game.player1).to eql("al")
				expect(@game.player2).to eql("bo")
			end

			it "resets the board to the default starting positions" do
				@game.board.display
			end
		end

		context "#coorinate_parser" do
			it "intakes the coodinates given by players and returns the standard coord" do
				player1 = "al"
				player2 = "bo"
				game = Game.new(player1, player2)

				coord = "a4"
				expect(game.coordinate_parser(coord)).to eql([4, 0])
				move_coord = "d3"
				expect(game.coordinate_parser(move_coord)).to eql([5, 3])
				coord_test = "c3"
				expect(game.coordinate_parser(coord_test)).to eql([5, 2])
			end
		end


		context "#pawn_promote?" do
			it "returns true if there is a pawn that can be promoted" do
				player1 = "al"
				player2 = "bo"
				game = Game.new(player1, player2)
				game.board.board[0][0] = Pawn.new("white")

				expect(game.pawn_promote?).to be true
			end
		end

		context "#pawn_promotion" do
			before do
				$stdin = StringIO.new("Queen")
			end

			after do
				$stdin = STDIN
			end

			it "asks what piece pawn will be promoted to" do
				player1 = "al"
				player2 = "bo"
				game = Game.new(player1, player2)
				pawn_coord = [0, 0]
				game.board.board[0][0] = Pawn.new("white")
				game.pawn_promotion(pawn_coord)

				#expect(game.pawn_promotion(pawn_coord)).to eql("white")
				expect(game.board.board[0][0]).to be_instance_of Queen
			end
		end

		context "A test game" do
			#test a game as if played by two human players
			player1 = "white"
			player2 = "black"
			@@game = Game.new(player1, player2)

			it "white pawn to e4" do
				piece_coord = "e2"
				piece_coord_std = @@game.coordinate_parser(piece_coord)
				piece = @@game.board.select_piece(piece_coord_std)
				puts piece.inspect

				move_coord = "e4"
				move_coord_std = @@game.coordinate_parser(move_coord)
				move_coord_app = @@game.coordinate_parser(move_coord)

				if piece.valid_move?(piece_coord_std, move_coord_std, @@game.board)

					piece.move(piece_coord_std, move_coord_app, @@game.board)
					@@game.board.display	

				else
					puts "please add a valid move"
					puts ""
	    			@@game.board.display
				end

				expect(@@game.board.board[4][4]).to be_instance_of Pawn
			end

			it "black pawn to e6" do
				piece_coord = "e7"
				piece_coord_std = @@game.coordinate_parser(piece_coord)
				piece = @@game.board.select_piece(piece_coord_std)
				puts piece.inspect

				move_coord = "e6"
				move_coord_std = @@game.coordinate_parser(move_coord)

				if piece.valid_move?(piece_coord_std, move_coord_std, @@game.board)
					piece.move(piece_coord_std, move_coord_std, @@game.board)
					@@game.board.display
				else
					puts "please add a valid move"
					puts ""
	    			@@game.board.display
				end

				expect(@@game.board.board[2][4]).to be_instance_of Pawn
			end

			it "white queens bishop to c4" do
				piece_coord = "f1"
				piece_coord_std = @@game.coordinate_parser(piece_coord)
				puts piece_coord_std.inspect
				piece = @@game.board.select_piece(piece_coord_std)
				#puts piece.inspect

				move_coord = "c4"
				move_coord_std = @@game.coordinate_parser(move_coord)
				move_coord_app = @@game.coordinate_parser(move_coord)

				if piece.valid_move?(piece_coord_std, move_coord_std, @@game.board)

					piece.move(piece_coord_std, move_coord_app, @@game.board)
					@@game.board.display	

				else
					puts "please add a valid move"
					puts ""
	    			@@game.board.display
				end

				expect(@@game.board.board[4][2]).to be_instance_of Bishop
			end

			it "black kings side knight to c6" do
				piece_coord = "b8"
				piece_coord_std = @@game.coordinate_parser(piece_coord)
				piece = @@game.board.select_piece(piece_coord_std)
				puts piece.inspect

				move_coord = "c6"
				move_coord_std = @@game.coordinate_parser(move_coord)
				move_coord_app = @@game.coordinate_parser(move_coord)

				if piece.valid_move?(piece_coord_std, move_coord_std, @@game.board)

					piece.move(piece_coord_std, move_coord_app, @@game.board)
					@@game.board.display	

				else
					puts "please add a valid move"
					puts ""
	    			@@game.board.display
				end

				expect(@@game.board.board[2][2]).to be_instance_of Knight
			end

			it "white pawn to d4" do
				piece_coord = "d2"
				piece_coord_std = @@game.coordinate_parser(piece_coord)
				piece = @@game.board.select_piece(piece_coord_std)
				puts piece.inspect

				move_coord = "d4"
				move_coord_std = @@game.coordinate_parser(move_coord)
				move_coord_app = @@game.coordinate_parser(move_coord)

				if piece.valid_move?(piece_coord_std, move_coord_std, @@game.board)

					piece.move(piece_coord_std, move_coord_app, @@game.board)
					@@game.board.display	

				else
					puts "please add a valid move"
					puts ""
	    			@@game.board.display
				end


				expect(@@game.board.board[4][3]).to be_instance_of Pawn
			end

			it "black queens side bishop to a3" do
				piece_coord = "f8"
				piece_coord_std = @@game.coordinate_parser(piece_coord)
				piece = @@game.board.select_piece(piece_coord_std)
				puts piece.inspect

				move_coord = "a3"
					move_coord_std = @@game.coordinate_parser(move_coord)
				move_coord_app = @@game.coordinate_parser(move_coord)

				if piece.valid_move?(piece_coord_std, move_coord_std, @@game.board)

					piece.move(piece_coord_std, move_coord_app, @@game.board)
					@@game.board.display	

				else
					puts "please add a valid move"
					puts ""
	    			@@game.board.display
				end


				expect(@@game.board.board[5][0]).to be_instance_of Bishop
			end

			it "white queen to c3" do
				piece_coord = "e1"
				piece_coord_std = @@game.coordinate_parser(piece_coord)
				piece = @@game.board.select_piece(piece_coord_std)
				puts piece.inspect

				move_coord = "c3"
					move_coord_std = @@game.coordinate_parser(move_coord)
				move_coord_app = @@game.coordinate_parser(move_coord)

				if piece.valid_move?(piece_coord_std, move_coord_std, @@game.board)

					piece.move(piece_coord_std, move_coord_app, @@game.board)
					@@game.board.display	

				else
					puts "please add a valid move"
					puts ""
	    			@@game.board.display
				end


				expect(@@game.board.board[5][2]).to be_instance_of Queen
			end

			it "black bishop capture white pawn at b2" do
				piece_coord = "a3"
				piece_coord_std = @@game.coordinate_parser(piece_coord)
				piece = @@game.board.select_piece(piece_coord_std)
				puts piece.inspect

				move_coord = "b2"
					move_coord_std = @@game.coordinate_parser(move_coord)
				move_coord_app = @@game.coordinate_parser(move_coord)

				if piece.valid_move?(piece_coord_std, move_coord_std, @@game.board)

					piece.move(piece_coord_std, move_coord_app, @@game.board)
					@@game.board.display	

				else
					puts "please add a valid move"
					puts ""
	    			@@game.board.display
				end

				expect(@@game.board.board[6][1]).to be_instance_of Bishop
			end
		end

		context "#play" do
			#play the damn thing
			it "displays the board at the current state" do
			end

			it "checks if either king is in check and returns check" do
			end

			it "asks for player to select a piece" do
			end 

			it "asks for a player to input a move" do
			end

			it "moves the piece to that place" do
			end

			it "returns an error if the move is not valid" do
			end

			it "asks the second player to select a piece" do
			end

			it "asks for a player to input a move" do
			end

			it "moves the piece to that place" do
			end

			it "returns an error if the move is not valid" do
			end
		end

	end
end
