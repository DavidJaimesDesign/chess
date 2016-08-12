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
			end

			it "returns true for vertical positive movement" do
			end

			it "returns true for vertical negative movement" do
			end

			it "returns true for horizontal positive movement" do
			end

			it "returns true for horizontal negative movement" do
			end

			it "returns true for right up diagonal" do
			end

			it "returns true for right down diagonal" do
			end

			it "returns true for left up diagonal" do
			end

			it "returns true for left down diagonal" do
			end

			it "returns false for jumping over pieces" do
			end
		end
	end
end