require 'spec_helper'

module Chess 
	describe End_Game do
		#In one sentence it tells you if the game is over or close by way of check, check_mate, or stalemate
		context "#initialize" do
			it "initializes with a king piece, a board, and the kings coordinates" do
				board = Board.new
				king  = King.new("white")

				board.board[3][3] = king 

				king_coord = [3,3]

				end_game = End_Game.new(king, board, king_coord)

				expect(end_game.king).to eq(king)
				expect(end_game.board).to eq(board)
				expect(end_game.king_coord).to eq(king_coord)
			end
		end

		context "#check?" do
			#returns true for any situation where the king is in check
			before(:each) do
				@board        = Board.new
				@king   	  = King.new("white")
				@black_knight = Knight.new("black")
				@black_rook   = Rook.new("black")
				@black_bishop = Bishop.new("black")
				@black_queen  = Queen.new("black")
				@black_pawn	  = Pawn.new("black")

				@board.board[3][3] = @king
				@board.board[4][1] = @black_knight
				@board.board[6][3] = @black_rook
				@board.board[6][6] = @black_bishop
				@board.board[0][3] = @black_queen
				@board.board[4][2] = @black_pawn

				@king_coord = [3,3]

				@end_game = End_Game.new(@king, @board, @king_coord)
			end
			it "returns true if the king is threatend by a knight" do
				expect(@end_game.check?).to be true
			end

			it "returns true if the kinng is threatend by a rook in vert or horizontal" do
				expect(@end_game.check?).to be true
			end

			it "returns true if the king is threatend by a bishop in a diagonal" do
				expect(@end_game.check?).to be true
			end

			it "returns true if the kings is threatend by a queen in the multi directions" do
				expect(@end_game.check?).to be true
			end

			it "returns true if the king is threatend by a pawn in the diagonal" do
				expect(@end_game.check?).to be true
			end 
		end

		context "#knight_check?" do
			before(:each) do
				@board        = Board.new
				@king   	  = King.new("white")
				@black_knight = Knight.new("black")

				@board.board[3][3] = @king
			end

			it "returns true if the king is threatend by a knight of the opposinng team" do
				@board.board[5][4] = @black_knight
				king_coord =[3, 3]
				end_game = End_Game.new(@king, @board, king_coord)

				expect(end_game.knight_check?).to be true
			end

			it "returns false otherwise" do
				@board.board[7][7] = @black_knight
				king_coord = [3, 3]
				end_game = End_Game.new(@king, @board, king_coord)

				expect(end_game.knight_check?).to be false
			end
		end

		context "#right_check?" do
			before(:each) do
				@board        = Board.new
				@king   	  = King.new("white")
				@black_rook   = Rook.new("black")
				@black_queen  = Queen.new("black") 


				@board.board[3][3] = @king
			end
			it "returns true if the king is threatend on the right by either a queen or a rook of the opposing team" do
				@board.board[3][6] = @black_queen
				king_coord[3][3]
				end_game = End_Game.new(@king, @board, king_coord)

				expect(end_game.right_check?).to be true
			end

			it "returns false otherwise" do
				@board.board[3][0] = @black_queen
				king_coord[3][3]
				end_game = End_Game.new(@king, @board, king_coord)

				expect(end_game.right_check?).to be false
			end
		end

		context "#left_check?" do
			it "returns true if the king is threatend on the left by either a queen or a rook of the opposing team" do
			end

			it "returns false otherwise" do
			end
		end

		context "#horizontal_check?" do
			it "returns true if the king is threatend on either right or left by either a queen or a rook of the opposing team" do
			end

			it "returns false otherwise" do
			end
		end

		context "#vertical_check?" do
			it "returns true if the king is threatend vertically by either a queen or a rook" do
			end

			it "returns false otherwise" do
			end
		end

		context "#diagonal_check?" do
			it "returns true if the king is threatend diagonaly by either a queen or a bishop of the opposing team" do
			end

			it "returns false otherwise" do
			end
		end

		context "pawn_check?" do
			#postpone until we have checked the pawn movement rules
		end

		context "#check_mate" do
			#returns true for any situation where the king is in check_mate
		end

		context "#stalemate" do
			#returns true for any situation where the game ends in a stalemate
		end
	end
end