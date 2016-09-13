module Chess
	class End_Game
		attr_reader :king, :board, :king_coord 
		def initialize(king, board, king_coord)
			@king 		= king
			@board 		= board
			@king_coord = king_coord
		end

		def check?
			board.board.each_with_index do |row, r_index|
				row.each_with_index do |cell, c_index|
					coord_i = [r_index, c_index]
					#puts coord_i.inspect
					if cell != nil && cell.color != king.color && coord_i != king_coord && cell.valid_move?(coord_i, king_coord, board) 
						return true
					else 
						false
					end
				end
			end
			return false
		end

		def check_piece?
			board.board.each_with_index do |row, r_index|
				row.each_with_index do |cell, c_index|
					coord_i = [r_index, c_index]
					if cell != nil && cell.color != king.color && coord_i != king_coord && cell.valid_move?(coord_i, king_coord, board) 
						return cell
					else 
						false				
					end
				end
			end
			false
		end

		def check_piece_coordinates?	
			board.board.each_with_index do |row, r_index|
				row.each_with_index do |cell, c_index|
					coord_i = [r_index, c_index]
					#puts coord_i.inspect
					if cell != nil && cell.color != king.color && coord_i != king_coord && cell.valid_move?(coord_i, king_coord, board) 
						return [r_index, c_index]
					else 
						nil
					end
				end
			end
			return nil
		end

		def check_piece_intercept_array?(kc = self.king_coord_refresh, cpi_arr = [])
			cpc = check_piece_coordinates?
			return cpi_arr if cpc.nil? 
			dy = cpc[0] - kc[0]
			dx = cpc[1] - kc[1]

			if dy > 0 && dx > 0
				y = kc[0] + 1
				x = kc[1] + 1
				kc = [y, x]
				cpi_arr << [y, x]
				check_piece_intercept_array?(kc, cpi_arr)

			elsif dy > 0 && dx < 0
				y = kc[0] + 1
				x = kc[1] - 1
				kc = [y, x]
				cpi_arr << [y, x]
				check_piece_intercept_array?(kc, cpi_arr)

			elsif dy < 0 && dx > 0
				y = kc[0] - 1
				x = kc[1] + 1
				kc = [y, x]
				cpi_arr << [y, x]
				check_piece_intercept_array?(kc, cpi_arr)

			elsif dy < 0 && dx < 0
				y = kc[0] - 1
				x = kc[1] - 1
				kc = [y, x]
				cpi_arr << [y , x]
				check_piece_intercept_array?(kc, cpi_arr)

			elsif dy > 0 && dx == 0
				y = kc[0] + 1
				x = kc[1]
				kc = [y, x]
				cpi_arr << [y , x]
				check_piece_intercept_array?(kc, cpi_arr)

			elsif dy < 0 && dx == 0
				y = kc[0] - 1
				x = kc[1]
				kc = [y, x]
				cpi_arr << [y , x]
				check_piece_intercept_array?(kc, cpi_arr)

			elsif dy == 0 && dx > 0
				y = kc[0]
				x = kc[1] + 1
				kc = [y, x]
				cpi_arr << [y , x]
				check_piece_intercept_array?(kc, cpi_arr)

			elsif dy == 0 && dx < 0
				y = kc[0]
				x = kc[1] - 1
				kc = [y, x]
				cpi_arr << [y , x]
				check_piece_intercept_array?(kc, cpi_arr)

			else
				return cpi_arr
			end
		end


		def king_coord_refresh 
			board_c = board
			king_c = king
			king_coord_c = king_coord

			board_c.board.each_with_index do |row, r_index|
				row.each_with_index do |cell, c_index|
					coord_i = [r_index, c_index]
					#puts coord_i.inspect
					if cell == king 
						return [r_index, c_index]
					else 
						"ERROR no king"
					end
				end
			end
			return "ERROR no king"
		end 
		
		def king_move_escape?
			#false if all possible moves are still check mate but are valid
			#false if all possible moves are invalid
			#false if all possible moves still check or all possible moves are invalid
			king_possible_moves = self.king_possible_moves
			if self.king_all_move_check? || self.king_no_move_valid? 
				false
			else
				true
			end
		end

		def king_no_move_valid?
			king_possible_moves = self.king_possible_moves
			if king_possible_moves.any?{|move| @king.valid_move?(@king_coord, move, @board)} 
				false
			else
				true
			end
		end

		def king_all_move_check?
			king_possible_moves
			still_check = []

			king_possible_moves.each do |move|

				test_board = board.copy_board
				test_king  = king.dup
				test_board.board[king_coord[0]][king_coord[1]] = nil
				test_board.board[move[0]][move[1]] = test_king
				#test_board.display

				still_check_game = End_Game.new(test_king, test_board, move)
				test_board.board[move[0]][move[1]] = nil

				still_check << 1 if still_check_game.check?
			end
			
			if still_check.length == king_possible_moves.length
				#puts still_check.length
				#puts king_possible_moves.length
				true
			else
				#puts still_check.length
				#puts king_possible_moves.length
				false
			end
		end

		def king_possible_moves
			king_possible_moves = Array.new
			y  = king_coord[0]
			y1 = king_coord[0] + 1
			y2 = king_coord[0] - 1
			x  = king_coord[1]
			x1 = king_coord[1] + 1
			x2 = king_coord[1] - 1

			y1 = y if y1 > 7 
			y2 = y if y2 < 0
			x1 = x if x1 > 7 
			x2 = x if x2 < 0

			king_possible_moves = [[y1, x2],[y1, x],[y1, x1],[y, x2],[y, x1],[y2, x2],[y2, x],[y2, x1]]
			king_possible_moves = king_possible_moves.uniq
			return king_possible_moves
		end

		def any_capture_check_piece?
			check_piece_coord = check_piece_coordinates?

			@board.board.each_with_index do |row, r_index|
				row.each_with_index do |cell, c_index|
					coord_i = [r_index, c_index]
					#puts coord_i.inspect
					if cell != nil && cell.color == @king.color && coord_i != king_coord && cell.valid_move?(coord_i, check_piece_coord, @board) && cell != @king
						puts cell
						puts coord_i.inspect
						puts check_piece_coord.inspect
						return true
					else 
						false
					end
				end
			end
			return false
		end

		def any_intercept_check_piece?
			cp = check_piece?
			intercept = false
			return intercept if cp.instance_of? Knight
			@board.board.each_with_index do |row, r_index|
				row.each_with_index do |cell, c_index|
					coord_i = [r_index, c_index]
					if cell != nil && cell.color == @king.color && cell != @king 
						check_piece_intercept_array?.each do |coord|
							if cell.valid_move?(coord_i, coord, board) == true
								intercept = true
							elsif cell.valid_move?(coord_i, coord, board) == false
								false
							end
						end
						false
					else 
						false
					end
				end
			end
			return intercept
		end

		def copy_end_game
			king_copy       = King.new(king.color)
			board_copy      = board.copy_board
			king_coord_copy = [king_coord[0], king_coord[1]] 
			copy = End_Game.new(king_copy, board_copy, king_coord_copy)
			return copy
		end

		def check_mate?
			copy = copy_end_game
			if copy.check?
				copy = copy_end_game
				if copy.king_move_escape? == false
					copy = copy_end_game
					if check_piece_intercept_array?.length == 1
						if any_capture_check_piece? == false
							true
						else
							puts "you can capture check piece"
							false
						end
					else 
						if any_capture_check_piece? == false && any_intercept_check_piece? == false
							true
						else
							puts "you can capture checking piece or intercept it"
							false
						end
					end
					#bug not in check_piece_intercept_array
				else
					puts "not in check"
					false
				end
			else
				false
			end
		end
	end
end