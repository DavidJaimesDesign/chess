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
	end
end