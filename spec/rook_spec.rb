require 'spec_helper'

module Chess 
	describe Rook do
		context "#display" do
			it "returns the white rook unicode string for a white rook" do
				rook = Rook.new("white")
				expect(rook.display).to eq("\u2656".encode('utf-8'))
			end

			it "returns the black rook unicode string for a black rook" do
				rook = Rook.new("black")
				expect(rook.display).to eq("\u265C".encode('utf-8'))
			end
		end

		context "#valid_move?" do
			before(:each) do
				@board = Board.new
				@rook_white  = Rook.new("white")
				@rook_white2 = Rook.new("white")
				@rook_black  = Rook.new("black")
			end
			it "returns true for a vertical move" do
				@board.board[0][0] = @rook_white
				coord_i = [0, 0] 
				coord_f = [3, 0]
			end

			it "returns true for a horizontal move" do
			end

			it "returns false for anything not horizontal or vertical" do
			end

			it "returns true for capturing a piece in a vertical or horizontal position from it" do
			end

			it "returns false for jumping over a piece of any color" do
			end

			it "returns false for attempting to capture same color piece" do
			end
		end
	end
end