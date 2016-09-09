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

		context "#king_move_escape? true" do
			before(:each) do
				@@board = Board.new
				@@king  = King.new("white")

				@@board.board[3][3] = @@king 
				@@king_coord = [3,3]

			end
			it "goes through each of the moves that a king can make and if they are valid and puts the king out of check returns true" do
				@@board.board[1][3] = Rook.new("black")
				end_game = End_Game.new(@@king,@@board, @@king_coord)
				expect(end_game.king_move_escape?).to be true
			end

			it "checks to escape from a diagonal threat" do
				@@board.board[7][7] = Queen.new("black")
				end_game = End_Game.new(@@king,@@board, @@king_coord)
				expect(end_game.king_move_escape?).to be true
			end

			it "checks to escape from horizontal threat" do
				@@board.board[3][7] = Rook.new("black")
				end_game = End_Game.new(@@king,@@board, @@king_coord)
				expect(end_game.king_move_escape?).to be true
			end

			it "checks to escape by capture" do
				@@board.board[2][3] = Rook.new("black")
				end_game = End_Game.new(@@king,@@board, @@king_coord)
				expect(end_game.king_move_escape?).to be true
			end
		end

		context "#king_move_escape? false" do
			before(:each) do
				@@board = Board.new
				@@king  = King.new("white")

				@@board.board[3][3] = @@king 
				@@king_coord = [3,3]
			end 

			it "returns false: 2 rooks and a queen checkmate" do
				@@board.board[7][3] = Rook.new("black")
				@@board.board[7][2] = Rook.new("black")
				@@board.board[7][4] = Queen.new("black")

				end_game = End_Game.new(@@king, @@board, @@king_coord)
				expect(end_game.king_move_escape?).to be false
			end

			it "returns false: edge checkmate 2 rooks PENDING" do
				@@board.board[0][0] = @@king 
				@@king_coord = [0,0]
				@@board.board[0][3] = Rook.new("black")
				@@board.board[1][3] = Rook.new("black")

				end_game = End_Game.new(@@king, @@board, @@king_coord)
				expect(end_game.king_move_escape?).to be false
			end
  		end

  		context "#king_no_move_valid" do
  			it "returns true if there are no valid moves for the king" do
  				board = Board.new
  				board.board[3][3] = King.new("white")
  				board.board[4][2] = Pawn.new("white")
  				board.board[4][3] = Pawn.new("white")
  				board.board[4][4] = Pawn.new("white")
  				board.board[3][2] = Pawn.new("white")
  				board.board[3][4] = Pawn.new("white")
  				board.board[2][4] = Pawn.new("white")
  				board.board[2][3] = Pawn.new("white")
  				board.board[2][2] = Pawn.new("white")
  				king_coord = [3, 3]

  				end_game = End_Game.new(board.board[3][3], board, king_coord)
  				expect(end_game.king_no_move_valid?).to be true
  			end 

  			it "returns false otherwise" do
  				board = Board.new
  				board.board[3][3] = King.new("white")
  				king_coord = [3, 3]

  				end_game = End_Game.new(board.board[3][3], board, king_coord)
  				expect(end_game.king_no_move_valid?).to be false
  			end
  		end

  		context "#king_all_move_check?" do
  			before(:each) do
				@@board = Board.new
				@@king  = King.new("white")

				@@board.board[3][3] = @@king 
				@@king_coord = [3,3]
			end 

			it "returns true: 2 rooks and a queen checkmate" do
				@@board.board[7][3] = Rook.new("black")
				@@board.board[7][2] = Rook.new("black")
				@@board.board[7][4] = Queen.new("black")

				end_game = End_Game.new(@@king, @@board, @@king_coord)
				expect(end_game.king_all_move_check?).to be true
			end

  			it "returns false otherwise" do
  				@@board.board[1][3] = Rook.new("black")
				end_game = End_Game.new(@@king,@@board, @@king_coord)
				expect(end_game.king_all_move_check?).to be false
  			end
  		end

		context "#king_possible_moves" do
			before(:each) do
				@board = Board.new
				@king = King.new("black")
			end
			it "returns an array with all the moves the king can make" do
				king_coord = [3,3]
				@board.board[3][3] = @king
				end_game = End_Game.new(@king, @board, king_coord)
				expect(end_game.king_possible_moves).to eq([[4, 2],[4, 3],[4, 4],[3, 2],[3, 4],[2, 2],[2, 3],[2, 4]])
			end

			it "returns an array of possible moves even when up against a wall" do
				king_coord = [0, 3]
				@board.board[0][3] = @king
				end_game = End_Game.new(@king, @board, king_coord)
				expect(end_game.king_possible_moves).to eq([[1, 2], [1, 3], [1, 4], [0, 2], [0, 4], [0, 3]])
			end

			it "returns an array of possible moves even when in a corner" do
				king_coord = [0, 0]
				@board.board[0][0] = @king
				end_game = End_Game.new(@king, @board, king_coord)
				expect(end_game.king_possible_moves).to eq([[1, 0], [1, 1], [0, 0], [0, 1]])
			end
		end

		context "other pieces save the king?" do
			context "#check_piece_coordinates" do
				before(:each) do
					@board = Board.new
					@king = King.new("black")
				end
				it "returns the coordinates of a checking piece TEST 1" do 
					king_coord = [0,0]
					@board.board[0][0] = @king
					@board.board[2][0] = Queen.new("white")

					end_game = End_Game.new(@king, @board, king_coord)
					expect(end_game.check_piece_coordinates?).to eql([2,0])
				end

				it "returns the coordinates of a checking pieces TEST 2" do
					king_coord = [3,3]
					@board.board[3][3] = @king
					@board.board[7][7] = Bishop.new("white")

					end_game = End_Game.new(@king, @board, king_coord)
					expect(end_game.check_piece_coordinates?).to eql([7,7])
				end

				it "returns the coordinates of a checking piece TEST 3" do
					king_coord = [3,3]
					@board.board[3][3] = @king
					@board.board[1][2] = Knight.new("white")

					end_game = End_Game.new(@king, @board, king_coord)
					expect(end_game.check_piece_coordinates?).to eql([1, 2])
				end

				it "returns nil otherwise" do
					king_coord = [3,3]
					@board.board[2][2] = @king
					@board.board[0][7] = Bishop.new("white")

					end_game = End_Game.new(@king, @board, king_coord)
					expect(end_game.check_piece_coordinates?).to be nil
				end
			end
			context "#any_capture_check_piece? " do
				before(:each) do
					@board = Board.new
					@king = King.new("black")
				end

				it "returns true if there are any pieces that can capture the checking pieces" do
					king_coord = [0,0]
					@board.board[0][0] = @king
					@board.board[2][0] = Queen.new("white")
					@board.board[3][1] = Queen.new("white")
					@board.board[2][2] = Rook.new("black")

					end_game = End_Game.new(@king, @board, king_coord)
					expect(end_game.any_capture_check_piece?).to be true
				end

				it "returns false otherwise" do
					king_coord = [0,0]
					@board.board[0][0] = @king
					@board.board[2][0] = Queen.new("white")
					@board.board[3][1] = Queen.new("white")

					end_game = End_Game.new(@king, @board, king_coord)
					expect(end_game.any_capture_check_piece?).to be false
				end
			end

			context "can they intercept the checking pieces path?" do
				context "#check_piece_intercept_array?" do
					before(:each) do
						@board = Board.new
						@king = King.new("black")
					end
					it "returns the intercept array of a checking piece TEST 1" do 
						king_coord = [0,0]
						@board.board[0][0] = @king
						@board.board[2][0] = Queen.new("white")

						end_game = End_Game.new(@king, @board, king_coord)
						#expect(end_game.check_piece_intercept_array?).to eql([[1,0]])
					end

					it "returns the intercept array of a checking pieces TEST 2" do
						king_coord = [3,3]
						@board.board[3][3] = @king
						@board.board[1][5] = Queen.new("white")

						end_game = End_Game.new(@king, @board, king_coord)
						#expect(end_game.check_piece_intercept_array?).to eql([[6,6],[5,5],[4,4]])
					end

					it "returns the intercept array of a checking piece TEST 3" do
						king_coord = [3,3]
						@board.board[3][3] = @king
						@board.board[1][2] = Knight.new("white")

						end_game = End_Game.new(@king, @board, king_coord)
						#expect(end_game.check_piece_intercept_array?).to be nil
					end

					it "returns nil otherwise" do
						king_coord = [2,2]
						@board.board[2][2] = @king
						@board.board[0][7] = Bishop.new("white")

						end_game = End_Game.new(@king, @board, king_coord)
						#expect(end_game.check_piece_intercept_array?).to be nil
					end
				end

				context "#king_coord_refresh" do
					before(:each) do
						@board = Board.new
						@king = King.new("black")
					end
					it "finds the king and returns his actual coordinates FIXES DIAGONAL bug" do
						king_coord = [2,2]
						@board.board[2][2] = @king
						end_game = End_Game.new(@king, @board, king_coord)
						expect(end_game.king_coord_refresh).to eql([2,2])
					end

					it "returns an error if there is no king" do
						king_coord = [3,3]
						end_game = End_Game.new(@king, @board, king_coord)
						expect(end_game.king_coord_refresh).to eql("ERROR no king")

					end
				end

				context "#any_intercept_check_piece?" do
					it "returns true if a piece can intercept the checking piece" do
					end

					it "returns false otherwise" do
					end
				end

			end 
		end
		context "#stalemate" do
			#returns true for any situation where the game ends in a stalemate
		end
	end
end