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
				@board[0][0] = @piece 
			end
			it "moves the piece to the coordinates on the board" do
				coordinates = [0][1]
				expect(@piece.move())
			end

			it "deleted the piece from the init coordinates" do
			end
		end

		context "#capture" do
			before(:each) do
				@board = Board.new
				@piece_black = Piece.new("black")
				@piece_white = Piece.new("white")
			end
			it "removes the piece at the coordinates on the board" do
			end

			it "does not descriminate because of color(single purpose)" do
			end

			it "moves the capturing piece to the coordinates" do
			end
		end

		context "#delete" do
			it "sets the value of the piece to nil" do 
			end
		end
	end