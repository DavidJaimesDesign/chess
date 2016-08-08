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
			before(:each) do
				@board = Board.new
			end
			it "displays the game at the current state of the game" do
				expect(@board.display).to be_truthy
			end

			it "displays the pieces on the board at the current state of the game" do
			end
		end

		context "#new_game" do
			before(:each) do 
				@board = Board.new
				@board.new_game
			end

			it "sets up a new chess game" do 
			end

			it "when displayed is able to superimpose chess pieces" do 
			end
		end
	end
end
