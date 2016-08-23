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

			it "returns an error if not queen, rook, bishop, knight or pawn" do
			end 
			
			it "replaces the pawn at the location with the replacement piece" do
			end
		end

		context "#white_castleing" do
		end

		context "#black_castleing" do
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
