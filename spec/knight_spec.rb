require 'spec_helper'

module Chess
	describe Knight do
		context "#display" do
			it "returns the white knight unicode string for a white knight" do
				knight = Knight.new("white")
				expect(knight.display).to eq("\u2658".encode('utf-8'))
			end

			it "returns the the black unicode string for a black knight" do
				knight = Knight.new("black")
				expect(knight.display).to eq("\u265E".encode('utf-8'))
			end
		end

		context "#valid_move in optimal 6 possible move conditions" do
			before(:each) do
				@board        = Board.new
				@piece_white  = Knight.new("white")
				@piece_white2 = Knight.new("white")
				@piece_black  = Knight.new("black") 
			end
			it "returns false for team_kill coordinates" do
				@board.board[3][3] = @piece_white
				@board.board[5][4] = @piece_white2

				coord_i = [3, 3]
				coord_f = [5, 4]

				expect(@piece_white.valid_move?(coord_i, coord_f, @board)).to be false
			end

			it "returns false for moves outside of 6 possible moves" do
				@board.board[3][3] = @piece_white

				coord_i = [3, 3]
				coord_f = [5, 5]

				expect(@piece_white.valid_move?(coord_i, coord_f, @board)).to be false
			end

			it "returns true for any of the 6 valid moves" do
				@board.board[3][3] = @piece_white

				coord_i = [3, 3]
				coord_f = [5, 2] #5,3 works 5,2 does not

				expect(@piece_white.valid_move?(coord_i, coord_f, @board)).to be true
			end 
		end

		context "#valid_move in sub-optimal conditions" do
			it "returns false for moves outside the board" do
			end

			it "returns false for moves that are valid L moves but outside of the board" do
			end
		end
	end
end