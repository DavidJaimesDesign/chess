require 'spec_helper'
require 'stringio'

module Chess
	describe Castle do
		context "initialize" do
		end
		context "#white_king_side_castle" do
			before (:each) do
				board = Board.new.new_game
				@castle = Castle.new(board)
			end
			it "returns true for white kings side if count = 0" do
				@castle.board.board[7][1] = nil
				@castle.board.board[7][2] = nil

				@castle.white_king_side_castle

				expect(@castle.board.board[][]).to be_instance_of King
				expect(@castle.board.board[][]).to be_instance_of Rook
			end

			it "returns false if the king is in check" do
			end

			it "returns false if the counte is higher" do
			end 
		end
	end
end
=begin
		context "#white_king_side_castle" do
			before (:each) do
				player1 = "al"
				player2 = "bo"
				@game = Game.new(player1, player2)
			end
			it "castles the white king on kings side if it is a valid move" do
				@game.board.board[7][1] = nil
				@game.board.board[7][2] = nil

				@game.white_king_side_castle

				expect(@game.board.board[][]).to be_instance_of King
				expect(@game.board.board[][]).to be_instance_of Rook
			end
		end

		context "#white_queen_side_castle" do
			before (:each) do
				player1 = "al"
				player2 = "bo"
				@game = Game.new(player1, player2)
			end
			it "castles the white king on the Queen's side if valid" do
				@game.board.board[7][6] = nil
				@game.board.board[7][5] = nil
				@game.board.board[7][4] = nil

				expect(@game.board.board[][]).to be_instance_of King
				expect(@game.board.board[][]).to be_instance_of Rook
			end
		end

		context "black_kings_side_castle" do
			before (:each) do
				player1 = "al"
				player2 = "bo"
				@game = Game.new(player1, player2)
			end
			it "castles the black king on the kings side if valid" do
				@game.board.board[0][1] = nil
				@game.board.board[0][2] = nil

				expect(@game.board.board[0][6]).to be_instance_of King
				expect(@game.board.board[][]).to be_instance_of Rook
			end
		end

		context "black_kings_side_castle" do
			before (:each) do
				player1 = "al"
				player2 = "bo"
				@game = Game.new(player1, player2)
			end
			it "castles the black king on the queen's side if valid" do
				@game.board.board[0][6] = nil
				@game.board.board[0][5] = nil
				@game.board.board[0][4] = nil

				expect(@game.board.board[0][2]).to be_instance_of King
				expect(@game.board.board[0][3]).to be_instance_of Rook
			end
		end
=end