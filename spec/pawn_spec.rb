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

		context "#valid_move? for black piece" do
			#this includes capture as well
			before(:each) do
				@board = Board.new
				@pawn_black1 = Pawn.new("black")
				@pawn_white1 = Pawn.new("white") 
			end
			it "returns true for a vertical one square move" do 
				@board.board[0][0] = @pawn_black1
				coord_i = [0, 0]
				coord_f = [1, 0]

				expect(@pawn_black1.valid_move?(coord_i, coord_f, @board)).to be true 
			end 

			it "returns false for a vertical move if there is a piece present at coord_f" do 
				@board.board[0][0] = @pawn_black1
				@board.board[1][0] = @pawn_white1
				coord_i = [0, 0]
				coord_f = [1, 0]

				expect(@pawn_black1.valid_move?(coord_i, coord_f, @board)).to be false 
			end

			it "returns true for a one space forward diagonal move if there is an opposite color piece present" do
				@board.board[0][0] = @pawn_black1
				@board.board[1][1] = @pawn_white1

				coord_i = [0, 0]
				coord_f = [1, 1]

				expect(@pawn_black1.valid_move?(coord_i, coord_f, @board)).to be true
			end

			it "returns false for any backwards move" do
				@board.board[1][0] = @pawn_black1
				coord_i = [1, 0]
				coord_f = [0, 0]

				expect(@pawn_black1.valid_move?(coord_i, coord_f, @board)).to be false
			end

			it "returns false for any move that is not a vertical one move or a diagonal capture" do
				@board.board[1][0] = @pawn_black1
				coord_i = [0, 0]
				coord_f = [3, 4]

				expect(@pawn_black1.valid_move?(coord_i, coord_f, @board)).to be false
			end
		end

		context "#valid_move with a white piece" do
			#this includes capture as well
			before(:each) do
				@board = Board.new
				@pawn_white = Pawn.new("white")
				@pawn_black = Pawn.new("black") 
			end
			it "returns true for a vertical one square move" do 
				@board.board[7][0] = @pawn_white
				coord_i = [7, 0]
				coord_f = [6, 0]

				expect(@pawn_white.valid_move?(coord_i, coord_f, @board)).to be true 
			end 

			it "returns false for a vertical move if there is a piece present at coord_f" do 
				@board.board[7][0] = @pawn_white
				@board.board[6][0] = @pawn_black
				coord_i = [7, 0]
				coord_f = [6, 0]

				expect(@pawn_white.valid_move?(coord_i, coord_f, @board)).to be false 
			end

			it "returns true for a one space forward diagonal move if there is an opposite color piece present" do
				@board.board[7][7] = @pawn_white
				@board.board[6][6] = @pawn_black

				coord_i = [7, 7]
				coord_f = [6, 6]

				expect(@pawn_white.valid_move?(coord_i, coord_f, @board)).to be true
			end

			it "returns false for any backwards move" do
				@board.board[6][6] = @pawn_white
				coord_i = [6, 6]
				coord_f = [7, 6]

				expect(@pawn_white.valid_move?(coord_i, coord_f, @board)).to be false
			end

			it "returns false for any move that is not a vertical one move or a diagonal capture" do
				@board.board[6][6] = @pawn_white
				coord_i = [6, 6]
				coord_f = [3, 7]

				expect(@pawn_white.valid_move?(coord_i, coord_f, @board)).to be false
			end
		end
	end
end