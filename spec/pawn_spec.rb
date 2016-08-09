require 'spec_helper'

module Chess
	describe Pawn do
		context "#display" do
			it "returns the white pawn unicode for a white pawn" do
				pawn = Pawn.new("white")
				expect(pawn.display).to eq("\u2659".encode('utf-8'))
			end

			it "returns the the black unicode string for a black pawn" do
				pawn = Pawn.new("black")
				expect(pawn.display).to eq("\u265F".encode('utf-8'))
			end

		end

		context "#valid_move?" do
			#this includes capture as well
			before(:each) do
				@board = Board.new
				@pawn_white1 = Pawn.new("white")
				@pawn_black2 = Pawn.new("black") 
			end
			it "returns true for a vertical one square move" do 
				@board.board[0][0] = @pawn_white1
				coord_i = [0, 0]
				coord_f = [1, 0]

				expect(@pawn_white1.valid_move?(coord_i, coord_f, @board)).to be true 
			end 

			it "returns false for a vertical move if there is a piece present at coord_f" do 
				@board.board[0][0] = @pawn_white1
				@board.board[1][0] = @pawn_black2
				coord_i = [0, 0]
				coord_f = [1, 0]

				expect(@pawn_white1.valid_move?(coord_i, coord_f, @board)).to be false 
			end

			it "returns true for a one space forward diagonal move if there is an opposite color piece present" do
				@board.board[0][0] = @pawn_white1
				@board.board[1][1] = @pawn_black2

				coord_i = [0, 0]
				coord_f = [1, 1]

				expect(@pawn_white1.valid_move?(coord_i, coord_f, @board)).to be true
			end

			it "returns false for any backwards move" do
				@board.board[1][0] = @pawn_white1
				coord_i = [1, 0]
				coord_f = [0, 0]

				expect(@pawn_white1.valid_move?(coord_i, coord_f, @board)).to be false
			end

			it "returns false for any move that is not a vertical one move or a diagonal capture" do
				@board.board[1][0] = @pawn_white1
				coord_i = [0, 0]
				coord_f = [3, 4]

				expect(@pawn_white1.valid_move?(coord_i, coord_f, @board)).to be false
			end
		end

		context "#promote" do
		end
	end
end
