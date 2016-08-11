require 'spec_helper'

module Chess
	describe Bishop do
		context "#display" do
			it "returns the white bishop unicode string for a white bishop" do
				bishop = Bishop.new("white")
				expect(bishop.display).to eq("\u2657".encode('utf-8'))
			end

			it "returns the the black unicode string for a black pawn" do
				bishop = Bishop.new("black")
				expect(bishop.display).to eq("\u265D".encode('utf-8'))
			end
		end

		context "#valid_move" do
			before(:each) do
				@bishop_white  = Bishop.new("white")
				@bishop_white2 = Bishop.new("white")
				@board 		   = Board.new
			end
			it "checks for team kill moves and returns false" do
				@board.board[3][3] = @bishop_white
				@board.board[4][4] = @bishop_white2

				coord_i = [3, 3]
				coord_f = [4, 4]

				expect(@bishop_white.valid_move?(coord_i,coord_f, @board)).to be false
			end

			it "returns false if movement is linear, either vertical or horizontal" do
				@board.board[3][3] = @bishop_white

				coord_i  = [3, 3]
				coord_f  = [3, 4]
				coord_f2 = [3, 1]
				coord_f3 = [5, 3]
				coord_f4 = [0, 3]

				expect(@bishop_white.valid_move?(coord_i, coord_f, @board)).to be false 
				expect(@bishop_white.valid_move?(coord_i, coord_f2, @board)).to be false 
				expect(@bishop_white.valid_move?(coord_i, coord_f3, @board)).to be false 
				expect(@bishop_white.valid_move?(coord_i, coord_f4, @board)).to be false 
			end

			it "returns false for movemnet outside of (x+1, y+1) parameter" do
			end

			it "returns true for movement up grid with slope 1" do
			end

			it "returns true for movement up grid with slope -1" do
			end

			it "returns true for movement down grid with slope 1" do
			end

			it "returns true for movement down grid with slope -1" do
			end
		end
	end 
end