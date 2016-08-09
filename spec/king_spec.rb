require 'spec_helper'

module Chess
	describe King do
		context "#display" do
			it "returns the white king unicode string for a white king" do
				king = King.new("white")
				expect(king.display).to eq("\u2654".encode('utf-8'))
			end

			it "returns the the black unicode string for a black king" do
				king = King.new("black")
				expect(king.display).to eq("\u265A".encode('utf-8'))
			end
		end
	end
end