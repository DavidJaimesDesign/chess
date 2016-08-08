require 'spec_helper'

module Chess
	describe Piece do
		context "#initialize" do
			it "initializes with a color" do
				piece = Piece.new("black")
				expect(piece.color).to eq("black")
			end
			#the sub classes will have all of the restrictions and specifics they should have
		end
		context "#move" do
			before(:each) do
				@board = Board.new
				@piece = Piece.new("black")
				@board.board[0][0] = @piece 
				@coordinates_i = [0 ,0]
				@coordinates_f = [0, 1]
				@piece.move(@coordinates_i, @coordinates_f, @board)
			end
			it "moves the piece to the coordinates on the board" do
				expect(@board.board[0][1]).to eq(@piece)
			end

			it "deleted the piece from the init coordinates" do
				expect(@board.board[0][0]).to be_nil
			end
		end

		context "capturing pieces" do
			#indiscriminate does not check for color that is for higher methods
			#for now there is no need for a capture method since move does the same thing
			#still going to test for capturing 
			before(:each) do
				@board = Board.new
				@piece_black = Piece.new("black")
				@piece_white = Piece.new("white")
				@board.board[0][0] = @piece_white
				@board.board[0][1] = @piece_black
				@coordinates_i = [0, 0]
				@coordinates_f = [0, 1]
				@piece_white.move(@coordinates_i, @coordinates_f, @board)
			end
			it "removes the piece at the coordinates on the board" do
				expect(@board.board[0][1]).to_not eq(@piece_black)
			end

			it "moves the capturing piece to the coordinates" do
				expect(@board.board[0][1]).to eq(@piece_white)
			end
		end
	end
end