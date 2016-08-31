require 'spec_helper'

module Chess
	describe Piece do
		context "#initialize" do
			it "initializes with a color" do
				piece = Piece.new("black")
				expect(piece.color).to eq("black")
			end

			it "initializes with a count meter of 0" do 
				piece = Piece.new("black")
				expect(piece.count).to eq(0)
			end
			#the sub classes will have all of the restrictions and specifics they should have
		end
		context "#move" do
			before(:each) do
				@board = Board.new
				@piece = Piece.new("black")
				@board.board[0][0] = @piece 
				@coordinates_i = [0 ,0]
				@coordinates_f = [7, 7]
				@piece.move(@coordinates_i, @coordinates_f, @board)
			end
			it "moves the piece to the coordinates on the board" do
				expect(@board.board[7][7]).to eq(@piece)
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

		context "#team_kill?" do
			it "returns true if there is a piece of the same team at coordinates" do
				board = Board.new
				piece_white  = Piece.new("white")
				piece_white2 = Piece.new("white")
				board.board[0][0] = piece_white
				board.board[0][1] = piece_white2

				coordinates_f = [0, 1]

				expect(piece_white.team_kill?(coordinates_f, board)).to be true 
			end

			it "returns false if there is a piece of a different suit at coordinates" do
				board = Board.new
				piece_white  = Piece.new("white")
				piece_black = Piece.new("black")
				board.board[0][0] = piece_white
				board.board[0][1] = piece_black

				coordinates_f = [0, 1]

				expect(piece_white.team_kill?(coordinates_f, board)).to be false

			end 
		end

		context "#vertical_positive_move" do
			before(:each) do
				@piece = Piece.new("white")
			end
			it "returns true for vertical positve moves" do
				ci = [0, 0]
				cf = [3, 0]

				expect(@piece.vertical_positive_move(ci,cf)).to be true
			end

			it "returns false for all other moves" do
				ci = [3, 0]
				cf = [2, 0]

				expect(@piece.vertical_positive_move(ci,cf)).to be false
			end
		end

		context "#vertical_negative_move" do
			before(:each) do
				@piece = Piece.new("white")
			end

			it "returns true for vertical negative moves" do
				ci = [3, 0]
				cf = [0, 0]

				expect(@piece.vertical_negative_move(ci, cf)).to be true
			end

			it "returns false for all other moves" do
				ci = [0, 0]
				cf = [3, 0]

				expect(@piece.vertical_negative_move(ci, cf)).to be false
			end
		end

		context "#horizontal_positive_move" do
			before(:each) do
				@piece = Piece.new("white")
			end

			it "returns true for horizontal positve moves" do
				ci = [0, 0]
				cf = [0, 4]

				expect(@piece.horizontal_positive_move(ci, cf)).to be true
			end

			it "returns false for all other moves" do
				ci = [0, 4]
				cf = [0, 0]

				expect(@piece.horizontal_positive_move(ci, cf)).to be false
			end
		end

		context "#horizontal_negative_move" do
			before(:each) do
				@piece = Piece.new("white")
			end

			it "returns true for horizontal negative moves" do
				ci = [0, 4]
				cf = [0, 0]

				expect(@piece.horizontal_negative_move(ci, cf)).to be true
			end

			it "returns false for all other moves" do
				ci = [0, 0]
				cf = [3, 5]

				expect(@piece.horizontal_negative_move(ci, cf)).to be false
			end
		end

		context "#right_up_diagonal_move" do
			before(:each) do
				@piece = Piece.new("white")
			end

			it "returns true for right up diagonal moves" do
				ci = [0, 0]
				cf = [5, 5]

				expect(@piece.right_up_diagonal_move(ci, cf)).to be true
			end

			it "returns false for all other moves" do
				ci = [3, 3]
				cf = [0, 0]
				expect(@piece.right_up_diagonal_move(ci, cf)).to be false
			end
		end

		context "#right_down_diagonal_move" do
			before(:each) do
				@piece = Piece.new("white")
			end

			it "returns true for right down diagonal moves" do
				ci = [3, 0]
				cf = [0, 3]

				expect(@piece.right_down_diagonal_move(ci, cf)).to be true
			end

			it "returns false for all other moves" do
				ci = [0, 0]
				cf = [5, 5]

				expect(@piece.right_down_diagonal_move(ci, cf)).to be false
			end
		end

		context "left_up_diagonal_move" do
			before(:each) do
				@piece = Piece.new("white")
			end

			it "returns true for left up diagonal moves" do
				ci = [3, 3]
				cf = [4, 2]

				expect(@piece.left_up_diagonal_move(ci, cf)).to be true
			end

			it "returns false for all other moves" do
				ci = [3, 0]
				cf = [0, 3]

				expect(@piece.left_up_diagonal_move(ci, cf)).to be false
			end
		end

		context "left_down_diagonal_move" do
			before(:each) do
				@piece = Piece.new("white")
			end

			it "returns true for left down diagonal moves" do
				ci = [3, 3]
				cf = [2, 2]

				expect(@piece.left_down_diagonal_move(ci, cf)).to be true
			end

			it "returns false for all other moves" do
				ci = [3, 3]
				cf = [4, 2]

				expect(@piece.left_down_diagonal_move(ci, cf)).to be false
			end
		end
	end
end