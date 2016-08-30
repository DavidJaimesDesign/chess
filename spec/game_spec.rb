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

				if piece.valid_move?(piece_coord_std, move_coord_std, @@game.board)
					piece.move(piece_coord_std, move_coord_std, @@game.board)
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

			it "white queens bishop to d3" do
				piece_coord = "f1"
				piece_coord_std = @@game.coordinate_parser(piece_coord)
				piece = @@game.board.select_piece(piece_coord_std)
				puts piece.inspect

				move_coord = "d3"
				move_coord_std = @@game.coordinate_parser(move_coord)

				if piece.valid_move?(piece_coord_std, move_coord_std, @@game.board)
					piece.move(piece_coord_std, move_coord_std, @@game.board)
					@@game.board.display
				else
					puts "please add a valid move"
					puts ""
	    			@@game.board.display
				end

				expect(@@game.board.board[5][3]).to be_instance_of Bishop
			end

			it "black kings side knight to c6" do
			end

			it "white queens side knight to h3" do
			end

			it "black queens side bishop to a3" do
			end

			it "white queen to e3" do
			end

			it "black bishop capture white pawn at b2" do
			end
		end
		#shits fucked from here on...
		context "#white_king_side_castle" do
			before (:each) do
				player1 = "al"
				player2 = "bo"
				@game = Game.new(player1, player2)
			end
			it "castles the white king on kings side if it is a valid move" do
				@game.board.board[7][1] = nil
				@game.board.board[7][2] = nil

				@game.white_king_side_castle

				expect(@game.board.board[][]).to be_instance_of King
				expect(@game.board.board[][]).to be_instance_of Rook
			end
		end

		context "#white_queen_side_castle" do
			before (:each) do
				player1 = "al"
				player2 = "bo"
				@game = Game.new(player1, player2)
			end
			it "castles the white king on the Queen's side if valid" do
				@game.board.board[7][6] = nil
				@game.board.board[7][5] = nil
				@game.board.board[7][4] = nil

				expect(@game.board.board[][]).to be_instance_of King
				expect(@game.board.board[][]).to be_instance_of Rook
			end
		end

		context "black_kings_side_castle" do
			before (:each) do
				player1 = "al"
				player2 = "bo"
				@game = Game.new(player1, player2)
			end
			it "castles the black king on the kings side if valid" do
				@game.board.board[0][1] = nil
				@game.board.board[0][2] = nil

				expect(@game.board.board[0][6]).to be_instance_of King
				expect(@game.board.board[][]).to be_instance_of Rook
			end
		end

		context "black_kings_side_castle" do
			before (:each) do
				player1 = "al"
				player2 = "bo"
				@game = Game.new(player1, player2)
			end
			it "castles the black king on the queen's side if valid" do
				@game.board.board[0][6] = nil
				@game.board.board[0][5] = nil
				@game.board.board[0][4] = nil

				expect(@game.board.board[0][2]).to be_instance_of King
				expect(@game.board.board[0][3]).to be_instance_of Rook
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
