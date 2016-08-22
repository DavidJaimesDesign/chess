require 'spec_helper'

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
