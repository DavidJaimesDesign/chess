require 'spec_helper'

module Chess
	describe King do
		context "#display" do
			it "returns the white king unicode string for a white king" do
				king = King.new("white")
				expect(king.display).to eq("\u2654".encode('utf-8'))
			end

			it "returns the the black unicode string for a black king" do
				king = King.new("black")
				expect(king.display).to eq("\u265A".encode('utf-8'))
			end
		end

		context "#valid_move" do
			before(:each) do
				@king  = King.new("white")
				@king2 = King.new("white")
				@board = Board.new
			end
			it "returns false for team_kill instances" do
				@board.board[3][3] = @king
				@board.board[3][4] = @king2

				coord_i = [3, 3]
				coord_f = [3, 4]

				expect(@king.valid_move?(coord_i, coord_f, @board)).to be false 
			end

			it "returns false for moves farther then one square in any direction" do
				@board.board[3][3] = @king
				coord_i = [3, 3]
				coord_f = [5, 5]

				expect(@king.valid_move?(coord_i, coord_f, @board)).to be false
			end

			it "returns true for moves 1 square in any direction" do
				@board.board[3][3] = @king

				coord_i  = [3, 3]
				coord_f  = [3, 4]
				coord_f2 = [3, 2]
				coord_f3 = [2, 3]
				coord_f4 = [2, 2]
				coord_f5 = [2, 4]
				coord_f6 = [4, 2]
				coord_f7 = [4, 3]
				coord_f8 = [4, 4]

				expect(@king.valid_move?(coord_i, coord_f, @board)).to be true
				expect(@king.valid_move?(coord_i, coord_f2, @board)).to be true
				expect(@king.valid_move?(coord_i, coord_f3, @board)).to be true
				expect(@king.valid_move?(coord_i, coord_f4, @board)).to be true
				expect(@king.valid_move?(coord_i, coord_f5, @board)).to be true
				expect(@king.valid_move?(coord_i, coord_f6, @board)).to be true
				expect(@king.valid_move?(coord_i, coord_f7, @board)).to be true
				expect(@king.valid_move?(coord_i, coord_f8, @board)).to be true
			end

			it "returns false for any moves that teleport from one edge of the board to the other" do @board.board[3][3] = @king
				@board.board[7][3] = @king
				coord_i = [7, 3]
				coord_f = [0, 3]
				expect(@king.valid_move?(coord_i, coord_f, @board)).to be false
			end
		end
	end
end