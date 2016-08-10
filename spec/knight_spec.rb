require 'spec_helper'

module Chess
	describe Knight do
		context "#display" do
			it "returns the white knight unicode string for a white knight" do
				knight = Knight.new("white")
				expect(knight.display).to eq("\u2658".encode('utf-8'))
			end

			it "returns the the black unicode string for a black knight" do
				knight = Knight.new("black")
				expect(knight.display).to eq("\u265E".encode('utf-8'))
			end
		end

		context "#valid_move in optimal 6 possible move conditions" do
			it "returns false for team_kill coordinates" do
			end

			it "returns false for moves outside of 6 possible moves" do
			end

			it "returns true for any of the 6 valid moves" do
			end 
		end

		context "#valid_move in sub-optimal conditions" do
			it "returns false for moves outside the board" do
			end

			it "returns false for moves that are valid L moves but outside of the board" do
			end
		end
	end
end