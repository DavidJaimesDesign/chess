require 'spec_helper'

module Chess
	describe Board do 
		context "#initialize" do
			it "initializes as an empty 2D 8x8 array" do
				board = Board.new
				expect(board.board).to eq([[nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil]])
			end	
		end

		context "#display" do
			before(:each) do
				@board = Board.new
			end
			it "displays the game at the current state of the game" do
				#expect(@board.display).to be_truthy
			end

			it "displays the pieces on the board at the current state of the game" do
				@board.new_game
				@board.display
			end
		end

		context "#new_game" do
			before(:each) do 
				@board = Board.new
				@board.new_game
			end

			it "has row 1 full of black pawns" do 
				expect(@board.board[1][0]).to be_instance_of Pawn
				expect(@board.board[1][1]).to be_instance_of Pawn
				expect(@board.board[1][2]).to be_instance_of Pawn
				expect(@board.board[1][3]).to be_instance_of Pawn
				expect(@board.board[1][4]).to be_instance_of Pawn
				expect(@board.board[1][5]).to be_instance_of Pawn
				expect(@board.board[1][6]).to be_instance_of Pawn
				expect(@board.board[1][7]).to be_instance_of Pawn
			end

			it "has row 6 full of white pawns" do 
				expect(@board.board[6][0]).to be_instance_of Pawn
				expect(@board.board[6][1]).to be_instance_of Pawn
				expect(@board.board[6][2]).to be_instance_of Pawn
				expect(@board.board[6][3]).to be_instance_of Pawn
				expect(@board.board[6][4]).to be_instance_of Pawn
				expect(@board.board[6][5]).to be_instance_of Pawn
				expect(@board.board[6][6]).to be_instance_of Pawn
				expect(@board.board[6][7]).to be_instance_of Pawn
			end

			it "Adds rooks to corresponding squares" do
				expect(@board.board[0][0]).to be_instance_of Rook
				expect(@board.board[0][7]).to be_instance_of Rook
				expect(@board.board[7][0]).to be_instance_of Rook
				expect(@board.board[7][7]).to be_instance_of Rook
			end

			it "Adds knights to corresponding squares" do
				expect(@board.board[0][1]).to be_instance_of Knight
				expect(@board.board[0][6]).to be_instance_of Knight
				expect(@board.board[7][1]).to be_instance_of Knight
				expect(@board.board[7][6]).to be_instance_of Knight
			end

			it "Adds bishops to corresponding squares" do
				expect(@board.board[0][2]).to be_instance_of Bishop
				expect(@board.board[0][5]).to be_instance_of Bishop
				expect(@board.board[7][2]).to be_instance_of Bishop
				expect(@board.board[7][5]).to be_instance_of Bishop
			end

			it "Adds Queens to corresponding squares" do
				expect(@board.board[0][4]).to be_instance_of Queen
				expect(@board.board[7][4]).to be_instance_of Queen
			end

			it "Adds Kings to corresponding squares" do
				expect(@board.board[0][3]).to be_instance_of King
				expect(@board.board[7][3]).to be_instance_of King

			end

		end

		context "#select_piece" do
			before(:each) do
				@board = Board.new
				@board.new_game
			end

			it "returns the piece at the x, y coordinates" do
				coord = [1, 0]
				expect(@board.select_piece(coord)).to be_instance_of Pawn
			end

			it "returns error for no piece present" do 
				coord = [3, 3]
				expect(@board.select_piece(coord)).to be nil 
			end
		end

		context "#copy_board" do
			before(:each) do
				@board = Board.new
				@board.new_game
				@board_copy = @board.copy_board
			end
			it "takes the current board and returns a copy of that board" do
				expect(@board_copy == @board).to be false
				expect(@board_copy).to be_instance_of Board
			end

			it "returns a new board with pieces in the same location as the original" do
				@board_copy.display
				expect(@board_copy.board[1][1]).to be_instance_of Pawn
				expect(@board_copy.board[7][7]).to be_instance_of Rook
				expect(@board_copy.board[0][3]).to be_instance_of King 
			end

			it "returns a new board with new pieces in the same location as the original" do
				expect(@board_copy.board[0][3] == @board.board[0][3]).to be false
				expect(@board_copy.board[7][7] == @board.board[7][7]).to be false
				expect(@board_copy.board[1][2] == @board.board[1][2]).to be false
				expect(@board_copy.board[7][3] == @board.board[7][3]).to be false
				expect(@board_copy.board[7][2] == @board.board[7][2]).to be false
			end
		end
	end
end