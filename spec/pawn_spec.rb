require 'spec_helper'

module Chess
	describe Pawn do
		context "#display" do
			it "returns the white pawn unicode for a white pawn" do
				pawn = Pawn.new("white")
				expect(pawn.display).to eq("\u2659".encode('utf-8'))
			end

			it "returns the the black unicode string for a black pawn" do
				pawn = Pawn.new("black")
				expect(pawn.display).to eq("\u265F".encode('utf-8'))
			end

		end

		context "#valid_move?" do
			#this includes capture as well
			it "returns true for a vertical one square move" do 
			end 

			it "returns false for a vertical move if there is a piece present at coord_f" do 
			end

			it "returns true for a one space forward diagonal move if there is an opposite color piece present" do
			end

			it "returns false for any backwards move" do
			end

			it "returns false for any move that is not a vertical one move or a diagonal capture" do
			end
		end

		context "#promote" do
		end
	end
end
