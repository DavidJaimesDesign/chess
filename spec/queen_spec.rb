require 'spec_helper'

module Chess
	describe Queen do
		context "#display" do
			it "returns the white queen unicode string for a white queen" do
				queen = Queen.new("white")
				expect(queen.display).to eq("\u2655".encode('utf-8'))
			end

			it "returns the the black queen unicode string for a black queen" do
				queen = Queen.new("black")
				expect(queen.display).to eq("\u265B".encode('utf-8'))
			end
		end

		context "#piece_jump_recur" do
		end

		context "#valid_move" do 
			before(:each) do
			@queen_white  = Queen.new("white")
			@queen_white2 = Queen.new("white")
			@board        = Board.new
			end

			it "returns false if the move is a team kill" do
				@board.board[0][0] = @queen_white
				@board.board[0][1] = @queen_white2

				ci = [0, 0]
				cf = [0, 1]

				expect(@queen_white.valid_move?(ci, cf, @board)).to be false 
			end

			it "checks false if the move is non linear(vartical, horizontal, diagonal(dy/dx = 1 || -1))" do
				@board.board[3][3] = @queen_white

				ci = [3, 3]
				cf = [5, 2]

				expect(@queen_white.valid_move?(ci, cf, @board)).to be false
			end

			it "returns true for vertical positive movement" do
				@board.board[3][3] = @queen_white

				ci = [3, 3]
				cf = [5, 3]

				expect(@queen_white.valid_move?(ci, cf, @board)).to be true
			end

			it "returns true for vertical negative movement" do
				@board.board[3][3] = @queen_white

				ci = [3, 3]
				cf = [0, 3]

				expect(@queen_white.valid_move?(ci, cf, @board)).to be true
			end

			it "returns true for horizontal positive movement" do
				@board.board[3][3] = @queen_white

				ci = [3, 3]
				cf = [3, 5]

				expect(@queen_white.valid_move?(ci, cf, @board)).to be true
			end

			it "returns true for horizontal negative movement" do
				@board.board[3][3] = @queen_white

				ci = [3, 3]
				cf = [3, 0]

				expect(@queen_white.valid_move?(ci, cf, @board)).to be true
			end

			it "returns true for right up diagonal" do
				@board.board[3][3] = @queen_white

				ci = [3, 3]
				cf = [4, 4]

				expect(@queen_white.valid_move?(ci, cf, @board)).to be true
			end

			it "returns true for right down diagonal" do
				@board.board[3][3] = @queen_white

				ci = [3, 3]
				cf = [2, 4]

				expect(@queen_white.valid_move?(ci, cf, @board)).to be true
			end

			it "returns true for left up diagonal" do
				@board.board[3][3] = @queen_white

				ci = [3, 3]
				cf = [4, 2]

				expect(@queen_white.valid_move?(ci, cf, @board)).to be true
			end

			it "returns true for left down diagonal" do
				@board.board[3][3] = @queen_white

				ci = [3, 3]
				cf = [2, 2]
				expect(@queen_white.valid_move?(ci, cf, @board)).to be true
			end

			it "returns false for jumping over pieces" do
				queen_black1 = Queen.new("black")
				queen_black2 = Queen.new("black")
				queen_black3 = Queen.new("black")
				queen_black4 = Queen.new("black")
				queen_black5 = Queen.new("black")
				queen_black6 = Queen.new("black")
				queen_black7 = Queen.new("black")
				queen_black8 = Queen.new("black")

				@board.board[3][3] = @queen_white
				@board.board[5][3] = queen_black1
				@board.board[1][3] = queen_black2
				@board.board[3][5] = queen_black3
				@board.board[3][1] = queen_black4
				@board.board[5][5] = queen_black5
				@board.board[1][5] = queen_black6
				@board.board[5][1] = queen_black7
				@board.board[1][1] = queen_black8

				coord_i          = [3, 3]
				coord_vert_pos	 = [6, 3]
				coord_vert_neg   = [0, 3]
				cord_horiz_pos   = [3, 6]
				cord_horiz_neg   = [3, 0]
				coord_right_up   = [6, 6]
				coord_right_down = [0, 0]
				coord_left_up    = [6, 0]
				coord_left_down  = [0, 0]

				expect(@queen_white.valid_move(coord_i,coord_vert_pos  ,@board)).to be false
				expect(@queen_white.valid_move(coord_i,coord_vert_neg  ,@board)).to be false
				expect(@queen_white.valid_move(coord_i,cord_horiz_pos  ,@board)).to be false
				expect(@queen_white.valid_move(coord_i,cord_horiz_neg  ,@board)).to be false
				expect(@queen_white.valid_move(coord_i,coord_right_up  ,@board)).to be false
				expect(@queen_white.valid_move(coord_i,coord_right_down,@board)).to be false
				expect(@queen_white.valid_move(coord_i,coord_left_up   ,@board)).to be false
				expect(@queen_white.valid_move(coord_i,coord_left_down ,@board)).to be false

			end
		end
	end
end