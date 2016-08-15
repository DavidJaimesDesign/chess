require 'spec_helper'

module Chess 
	describe End_Game do
		#In one sentence it tells you if the game is over or close by way of check, check_mate, or stalemate
		context "#initialize" do
			it "takes a king piece, and a board" do
			end
		end

		context "#check?" do
			#returns true for any situation where the king is in check
			it "returns true if the king is threatend by a knight" do
			end

			it "returns true if the kinng is threatend by a rook in vert or horizontal" do
			end

			it "returns true if the king is threatend by a bishop in a diagonal" do
			end

			it "returns true if the king is threatend by a pawn in the diagonal" do
			end 

			it "returns true if the kings is threatend by a queen in the multi directions" do
			end

		end

		context "#check_mate" do
			#returns true for any situation where the king is in check_mate
		end

		context "#stalemate" do
			#returns true for any situation where the game ends in a stalemate
		end
	end
end