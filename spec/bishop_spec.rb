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
				@board.board[3][3] = @bishop_white

				coord_i  = [3, 3]
				coord_f  = [4, 7]

				expect(@bishop_white.valid_move?(coord_i, coord_f, @board)).to be false 
			end

			it "returns true for right up diagonal" do
				@board.board[3][3] = @bishop_white

				coord_i  = [3, 3]
				coord_f  = [7, 7]

				expect(@bishop_white.valid_move?(coord_i, coord_f, @board)).to be true
				@bishop_white.move(coord_i, coord_f, @board)
				@board.display
			end

			it "returns true for right down diagonal" do
				@board.board[3][3] = @bishop_white

				coord_i  = [3, 3]
				coord_f  = [0, 0]

				expect(@bishop_white.valid_move?(coord_i, coord_f, @board)).to be true
				@bishop_white.move(coord_i, coord_f, @board)
				@board.display
			end

			it "returns true for left up diagonal" do
				@board.board[3][3] = @bishop_white

				coord_i  = [3, 3]
				coord_f  = [6, 0]

				expect(@bishop_white.valid_move?(coord_i, coord_f, @board)).to be true 
			end

			it "returns true for left down diagonal" do
				@board.board[3][3] = @bishop_white

				coord_i  = [3, 3]
				coord_f  = [0, 6]

				expect(@bishop_white.valid_move?(coord_i, coord_f, @board)).to be true
			end

			it "returns false for jumping pieces in any direction" do
				bishop_black1 = Bishop.new("black")
				bishop_black2 = Bishop.new("black")
				bishop_black3 = Bishop.new("black")
				bishop_black4 = Bishop.new("black")

				@board.board[3][3] = @bishop_white
				@board.board[5][5] = bishop_black1
				@board.board[1][5] = bishop_black2
				@board.board[5][1] = bishop_black3
				@board.board[1][1] = bishop_black4

				coord_i          = [3, 3]
				coord_right_up   = [6, 6]
				coord_right_down = [0, 0]
				coord_left_up    = [6, 0]
				coord_left_down  = [0, 0]	

				expect(@bishop_white.valid_move?(coord_i, coord_right_down, @board)).to be false
				expect(@bishop_white.valid_move?(coord_i, coord_right_up, @board)).to be false
				expect(@bishop_white.valid_move?(coord_i, coord_left_down, @board)).to be false
				expect(@bishop_white.valid_move?(coord_i, coord_left_up, @board)).to be false
			end
		end
	end 
end