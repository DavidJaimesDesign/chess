require 'spec_helper'

module Chess
	describe Board do 
		context "#initialize" do
			it "initializes as an empty 2D 8x8 array" do
				board = Board.new
				expect(board.board).to eq([[nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil],[nil,nil,nil,nil,nil,nil,nil,nil]])
			end	
		end

		context "#display" do
			it "displays the game at the current state of the game" do
			end
		end
	end
end
