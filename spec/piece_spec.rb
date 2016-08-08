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
			end
			it "moves the piece to the coordinates on the board" do
				coordinates_f = [0, 1]
				coordinates_i = [0, 0]
				@piece.move(coordinates_i, coordinates_f, @board)
				expect(@board.board[0][1]).to eq(@piece)
			end

			it "deleted the piece from the init coordinates" do
				coordinates_f = [0, 1]
				coordinates_i = [0, 0]
				@piece.move(coordinates_i, coordinates_f, @board)
				expect(@board.board[0][0]).to be_nil
			end
		end

		context "#capture" do
			#indiscriminate does not check for color that is for higher methods
			before(:each) do
				@board = Board.new
				@piece_black = Piece.new("black")
				@piece_white = Piece.new("white")
				@board.board[0][0] = @piece_white
				@board.board[0][1] = @piece_black
				coordinates = [0 , 1]
				@piece_white.capture(coordinates, @piece_black)
			end
			it "removes the piece at the coordinates on the board" do
				expect(@board.board[0][1]).not_be eq(@piece_black)
			end

			it "moves the capturing piece to the coordinates" do
				expect(@board.board[0][1]).to eq(@piece_white)
			end
		end
	end
end