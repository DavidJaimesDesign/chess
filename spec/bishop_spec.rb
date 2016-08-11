require 'spec_helper'

module Chess
	describe Bishop do
		context "#display" do
			it "returns the white bishop unicode string for a white bishop" do
				bishop = Bishop.new("white")
				expect(bishop.display).to eq("\u2657".encode('utf-8'))
			end

			it "returns the the black unicode string for a black pawn" do
				bishop = Bishop.new("black")
				expect(bishop.display).to eq("\u265D".encode('utf-8'))
			end
		end

		context "#valid_move" do
			it "checks for team kill moves and returns false" do
			end

			it "returns false if movement is linear, either vertical or horizontal" do
			end

			it "" do
			end
		end
	end 
end