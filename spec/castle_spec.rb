require 'spec_helper'
require 'stringio'

module Chess
	describe Castle do
		context "initialize" do
			it "initializes with a board" do
				board = Board.new
				board.new_game
				castle = Castle.new(board)

				expect(castle.board).to be_instance_of Board
			end
		end
		context "#white_king_side_castle" do
			before (:each) do
				board = Board.new
				board.new_game
				@castle = Castle.new(board)
			end
			it "returns true for white kings side if count = 0" do
				@castle.board.board[7][1] = nil
				@castle.board.board[7][2] = nil				

				expect(@castle.white_king_side_castle).to be true
			end

			it "returns false if the king is in check" do
				@castle.board.board[7][1] = nil
				@castle.board.board[7][2] = nil	
				@castle.board.board[6][3] = Queen.new("black")			

				expect(@castle.white_king_side_castle).to be false
			end

			it "returns false if the count for either piece > 0" do
				@castle.board.board[7][1] = nil
				@castle.board.board[7][2] = nil
				@castle.board.board[7][3].count = 1				

				expect(@castle.white_king_side_castle).to be false
			end 
		end

		context "#white_queen_side_castle" do
			before (:each) do
				board = Board.new
				board.new_game
				@castle = Castle.new(board)
				@castle.board.board[7][6] = nil
				@castle.board.board[7][5] = nil
				@castle.board.board[7][4] = nil
			end
			it "returns true for white Queen side if count = 0" do			
				expect(@castle.white_queen_side_castle).to be true
			end

			it "returns false if the king is in check" do
				@castle.board.board[6][3] = Queen.new("black")			

				expect(@castle.white_queen_side_castle).to be false
			end

			it "returns false if the count for either piece > 0" do
				@castle.board.board[7][3].count = 1				

				expect(@castle.white_queen_side_castle).to be false
			end 
		end

		context "#wblack_king_side_castle" do
			before (:each) do
				board = Board.new
				board.new_game
				@castle = Castle.new(board)
				@castle.board.board[0][1] = nil
				@castle.board.board[0][2] = nil
			end
			it "returns true for black kings side if count = 0" do			
				expect(@castle.black_king_side_castle).to be true
			end

			it "returns false if the king is in check" do
				@castle.board.board[1][3] = Queen.new("blue")			

				expect(@castle.black_king_side_castle).to be false
			end

			it "returns false if the count for either piece > 0" do
				@castle.board.board[0][3].count = 1				

				expect(@castle.black_king_side_castle).to be false
			end 
		end
=begin
		context "#black_queen_side_castle" do
			before (:each) do
				board = Board.new.new_game
				@castle = Castle.new(board)
			end
			it "returns true for white kings side if count = 0" do
				@castle.board.board[0][6] = nil
				@castle.board.board[0][5] = nil
				@castle.board.board[0][4] = nil

				expect(@castle.white_queen_side_castle).to be true

			it "returns false if the king is in check" do
			end

			it "returns false if the count for either piece > 0" do
			end 
		end
=end
	end
end
