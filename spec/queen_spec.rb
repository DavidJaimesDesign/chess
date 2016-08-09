require 'spec_helper'

module Chess
	describe Queen do
		context "#display" do
			it "returns the white queen unicode string for a white queen" do
				queen = Queen.new("white")
				expect(queen.display).to eq("\u2655".encode('utf-8'))
			end

			it "returns the the black queen unicode string for a black queen" do
				queen = Queen.new("black")
				expect(queen.display).to eq("\u265B".encode('utf-8'))
			end
		end
	end
end