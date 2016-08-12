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

				expect(@rook_white.valid_move?(coord_i, coord_f, @board)).to be true
			end

			it "returns true for a horizontal move" do
				@board.board[0][0] = @rook_white
				coord_i = [0, 0]
				coord_f = [0, 4]

				expect(@rook_white.valid_move?(coord_i, coord_f, @board)).to be true
			end

			it "returns false for anything not horizontal or vertical" do
				@board.board[0][0] = @rook_white
				coord_i = [0, 0] 
				coord_f = [3, 5]

				expect(@rook_white.valid_move?(coord_i, coord_f, @board)).to be false 
			end

			it "returns true for capturing a piece in a vertical or horizontal position from it" do
				@board.board[0][0] = @rook_white
				@board.board[3][0] = @rook_black

				coord_i = [0, 0]
				coord_f = [3, 0]

				expect(@rook_white.valid_move?(coord_i, coord_f, @board)).to be true
			end

			it "returns false for jumping over a piece of any color vertically" do
				#currently breaking on vertical but not horizontal
				
				rook_black2 = Rook.new("black")

				@board.board[3][0] = @rook_white
				@board.board[5][0] = @rook_black
				@board.board[1][0] = rook_black2
				
				coord_i   = [3, 0]
				coord_pos = [6, 0]
				coord_neg = [0, 0]

				expect(@rook_white.valid_move?(coord_i, coord_pos, @board)).to be false
				expect(@rook_white.valid_move?(coord_i, coord_neg, @board)).to be false

			end

			it "returns false for jumping over a piece of any color horizontally" do
				@board.board[0][0] = @rook_white
				@board.board[0][3] = @rook_black

				coord_i = [0, 0]
				coord_f = [0, 5]

				expect(@rook_black.valid_move?(coord_f, coord_i, @board)).to be false
			end

			it "returns false for attempting to capture same color piece" do
				#will this work both vertically and horizontally 
				@board.board[0][0] = @rook_white
				@board.board[0][3] = @rook_white2

				coord_i = [0, 0]
				coord_f = [0, 3]

				expect(@rook_white.valid_move?(coord_i, coord_f, @board)).to be false
			end
		end
	end
end