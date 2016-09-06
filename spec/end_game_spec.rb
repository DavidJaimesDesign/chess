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
		context "start of game" do
			before(:each) do
				@board = Board.new
				@board.new_game
			end

			it "returns false for white king begin in check" do
				end_game = End_Game.new(@board.board[7][3], @board, [7,3])
				expect(end_game.check?).to be false
			end

			#bug hunting at the start of the game the black king is in check like wut?

			it "returns false when there are only black pieces on the board for black king" do

			@board.board[6][0] = nil 
			@board.board[6][1] = nil 
			@board.board[6][2] = nil 
			@board.board[6][3] = nil 
			@board.board[6][4] = nil 
			@board.board[6][5] = nil 
			@board.board[6][6] = nil 
			@board.board[6][7] = nil 
			@board.board[7][7] = nil 
			@board.board[7][0] = nil 
			@board.board[7][1] = nil 
			@board.board[7][6] = nil 
			@board.board[7][2] = nil 
			@board.board[7][5] = nil 
			@board.board[7][4] = nil 
			@board.board[7][3] = nil 

				end_game = End_Game.new(@board.board[0][3], @board, [0,3])
				expect(end_game.check?).to be false
			end

			it "returns piece that is cheking the king" do
				end_game = End_Game.new(@board.board[0][3], @board, [0,3])
				expect(end_game.check_piece?).to be false
			end
		end
		
		context "#check?" do
			#returns true for any situation where the king is in check
			before(:each) do
				@board        = Board.new
				@king   	  = King.new("black")
				@black_knight = Knight.new("white")
				@black_rook   = Rook.new("white")
				@black_bishop = Bishop.new("white")
				@black_queen  = Queen.new("white")
				@black_pawn	  = Pawn.new("white")

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

		context "#knight check?" do
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

				expect(end_game.check?).to be true
			end

			it "returns false otherwise" do
				@board.board[7][7] = @black_knight
				king_coord = [3, 3]
				end_game = End_Game.new(@king, @board, king_coord)

				expect(end_game.check?).to be false
			end
		end

		context "#horizontal check right?" do
			before(:each) do
				@board        = Board.new
				@king   	  = King.new("white")
				@black_rook   = Rook.new("black")
				@black_queen  = Queen.new("black") 


				@board.board[3][3] = @king
			end
			it "returns true if the king is threatend on the right by either a queen or a rook of the opposing team" do
				@board.board[3][6] = @black_queen
				king_coord = [3, 3]
				end_game = End_Game.new(@king, @board, king_coord)

				expect(end_game.check?).to be true
			end

			it "returns false otherwise" do
				@board.board[0][1] = @black_queen
				king_coord = [3, 3]
				end_game = End_Game.new(@king, @board, king_coord)

				expect(end_game.check?).to be false
			end
		end

		context "#horizontal check left?" do
			before(:each) do
				@board        = Board.new
				@king   	  = King.new("white")
				@black_rook   = Rook.new("black")
				@black_queen  = Queen.new("black") 


				@board.board[3][3] = @king
			end
			it "returns true if the king is threatend on the left by either a queen or a rook of the opposing team" do
				@board.board[3][0] = @black_queen
				king_coord = [3, 3]
				end_game = End_Game.new(@king, @board, king_coord)

				expect(end_game.check?).to be true
			end

			it "returns false otherwise" do
				@board.board[0][2] = @black_queen
				king_coord = [3, 3]
				end_game = End_Game.new(@king, @board, king_coord)

				expect(end_game.check?).to be false
			end
		end

		context "#check?" do
			before(:each) do
				@board        = Board.new
				@king   	  = King.new("white")
				@black_rook   = Rook.new("black")
				@black_queen  = Queen.new("black") 


				@board.board[3][3] = @king
				@board.board[3][0] = @black_rook
				@board.board[3][7] = @black_queen
				@king_coord = [3, 3]
				@end_game = End_Game.new(@king, @board, @king_coord)
			end
			it "returns true if the king is threatend on the right" do
				expect(@end_game.check?).to be true
			end

			it "returns true if the king is threatend on the left" do 
				expect(@end_game.check?).to be true
			end

			it "returns false otherwise" do
				board        = Board.new
				king   	  = King.new("white")
				black_rook   = Rook.new("black")
				black_queen  = Queen.new("black") 


				board.board[3][3] = king
				board.board[5][0] = black_rook
				board.board[2][1] = black_queen
				king_coord = [3, 3]
				end_game = End_Game.new(king, board, king_coord)
				expect(end_game.check?).to be false
			end
		end
		context "#check" do
			before(:each) do
				@board        = Board.new
				@king   	  = King.new("white")
				@black_rook   = Rook.new("black")
				@black_queen  = Queen.new("black") 


				@board.board[3][3] = @king
			end
			it "returns true if the king is threatend from above by either a queen or a rook" do
				@board.board[1][3] = @black_queen
				king_coord = [3, 3]
				end_game = End_Game.new(@king, @board, king_coord)

				expect(end_game.check?).to be true
			end

			it "returns false otherwise" do
				@board.board[7][4] = @black_queen
				king_coord = [3, 3]
				end_game = End_Game.new(@king, @board, king_coord)

				expect(end_game.check?).to be false
			end
		end

		context "#check" do
			before(:each) do
				@board        = Board.new
				@king   	  = King.new("white")
				@black_rook   = Rook.new("black")
				@black_queen  = Queen.new("black") 


				@board.board[3][3] = @king
			end
			it "returns true if the king is threatend from below by either a queen or a rook" do
				@board.board[7][3] = @black_queen
				king_coord = [3, 3]
				end_game = End_Game.new(@king, @board, king_coord)

				expect(end_game.check?).to be true
			end

			it "returns false otherwise" do
				@board.board[1][2] = @black_queen
				king_coord = [3, 3]
				end_game = End_Game.new(@king, @board, king_coord)

				expect(end_game.check?).to be false
			end
		end

		context "#check?" do
			before(:each) do
				@board        = Board.new
				@king   	  = King.new("white")
				@black_rook   = Rook.new("black")
				@black_queen  = Queen.new("black") 


				@board.board[3][3] = @king
				@board.board[6][3] = @black_rook
				@board.board[0][3] = @black_queen
				@king_coord = [3, 3]
				@end_game = End_Game.new(@king, @board, @king_coord)
			end
			it "returns true if the king is threatend vertically by either a queen or a rook" do
				expect(@end_game.check?).to be true
			end

			it "returns false otherwise" do
				board        = Board.new
				king   	  = King.new("white")
				black_rook   = Rook.new("black")
				black_queen  = Queen.new("black") 


				board.board[3][3] = king
				board.board[5][0] = black_rook
				board.board[0][4] = black_queen
				king_coord = [3, 3]
				end_game = End_Game.new(king, board, king_coord)
				expect(end_game.check?).to be false
			end
		end
		context "#check?" do
			before(:each) do
				@board          = Board.new
				@king   	    = King.new("white")
				@black_bishop   = Bishop.new("black")
				@black_queen    = Queen.new("black") 


				@board.board[3][3] = @king
			end
			it "returns true if the king is threatend right pos diagonaly by either a queen or a bishop of the opposing team" do
				@board.board[5][5] = @black_queen
				king_coord = [3, 3]
				end_game = End_Game.new(@king, @board, king_coord)

				expect(end_game.check?).to be true
			end

			it "returns false otherwise" do
				@board.board[4][3] = @black_bishop
				king_coord = [3, 3]
				end_game = End_Game.new(@king, @board, king_coord)

				expect(end_game.check?).to be false
			end
		end

		context "#check?" do
			before(:each) do
				@board          = Board.new
				@king   	    = King.new("white")
				@black_bishop   = Bishop.new("black")
				@black_queen    = Queen.new("black") 


				@board.board[3][3] = @king
			end
			it "returns true if the king is threatend right neg diagonaly by either a queen or a bishop of the opposing team" do
				@board.board[1][5] = @black_bishop
				king_coord = [3, 3]
				end_game = End_Game.new(@king, @board, king_coord)

				expect(end_game.check?).to be true
			end

			it "returns false otherwise" do
				@board.board[1][4] = @black_queen
				king_coord = [3, 3]
				end_game = End_Game.new(@king, @board, king_coord)

				expect(end_game.check?).to be false
			end
		end

		context "#check?" do
			before(:each) do
				@board          = Board.new
				@king   	    = King.new("white")
				@black_bishop   = Bishop.new("black")
				@black_queen    = Queen.new("black") 


				@board.board[3][3] = @king
			end
			it "returns true if the king is threatend left pos diagonaly by either a queen or a bishop of the opposing team" do
				@board.board[5][1] = @black_queen
				king_coord = [3, 3]
				end_game = End_Game.new(@king, @board, king_coord)

				expect(end_game.check?).to be true
			end

			it "returns false otherwise" do
				@board.board[7][3] = @black_bishop
				king_coord = [3, 3]
				end_game = End_Game.new(@king, @board, king_coord)

				expect(end_game.check?).to be false
			end
		end

		context "#check?" do
			before(:each) do
				@board          = Board.new
				@king   	    = King.new("white")
				@black_bishop   = Bishop.new("black")
				@black_queen    = Queen.new("black") 


				@board.board[3][3] = @king
			end

			it "returns true if the king is threatend left neg diagonaly by either a queen or a bishop of the opposing team" do
				@board.board[1][1] = @black_bishop
				king_coord = [3, 3]
				end_game = End_Game.new(@king, @board, king_coord)

				expect(end_game.check?).to be true
			end

			it "returns false otherwise" do
				@board.board[7][4] = @black_queen
				king_coord = [3, 3]
				end_game = End_Game.new(@king, @board, king_coord)

				expect(end_game.check?).to be false
			end
		end

		context "#check?" do
			it "returns true if the king is threatend diagonaly by either a queen or a bishop of the opposing team" do
				board        = Board.new
				king   	     = King.new("white")
				black_bishop   = Bishop.new("black")
				black_queen  = Queen.new("black") 


				board.board[3][3] = king
				board.board[5][5] = black_bishop
				board.board[1][5] = black_queen
				king_coord = [3, 3]
				end_game = End_Game.new(king, board, king_coord)
				expect(end_game.check?).to be true
			end

			it "returns false otherwise" do
				board        = Board.new
				king   	     = King.new("white")
				black_bishop = Bishop.new("black")
				black_queen  = Queen.new("black") 


				board.board[3][3] = king
				board.board[2][5] = black_bishop
				board.board[3][7] = black_queen
				king_coord = [3, 3]
				end_game = End_Game.new(king, board, king_coord)
				expect(end_game.check?).to be false
			end
		end


		context "#check_mate" do
			#returns true for any situation where the king is in check_mate
			#check_mate defined: A situation where a king is in check and it cannot move out of check nor can any other pieces move out of check 
			#composed of two parts. The king moving away and all the other pieces moving away.
		end

		context "#king_move_escape?" do
			before(:each) do
				@@board = Board.new
				@@king  = King.new("white")

				@@board.board[3][3] = @@king 
				@@king_coord = [3,3]

			end
			it "goes through each of the moves that a king can make and if they are valid and puts the king out of check returns true" do
				@@board.board[1][3] = Rook.new("black")
				end_game = End_Game.new(@@king,@@board, @@king_coord)
				#expect(end_game.king_move_escape?).to be true
			end

			it "checks to escape from a diagonal threat" do
				@@board.board[7][7] = Queen.new("black")
				end_game = End_Game.new(@@king,@@board, @@king_coord)
				#expect(end_game.king_move_escape?).to be true
			end

			it "checks to escape from horizontal threat" do
				@@board.board[3][7] = Rook.new("black")
				end_game = End_Game.new(@@king,@@board, @@king_coord)
				#expect(end_game.king_move_escape?).to be true
			end

			it "checks to escape by capture" do
				@@board.board[2][3] = Rook.new("black")
				end_game = End_Game.new(@@king,@@board, @@king_coord)
				#expect(end_game.king_move_escape?).to be true
			end
		end

		context "#king_possible_moves" do
			it "returns an array with all the moves the king can make" do
			end
		end

		context "#stalemate" do
			#returns true for any situation where the game ends in a stalemate
		end
	end
end