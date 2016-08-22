$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'chess'
puts"      _                  ".to_s 
puts"     | |                  ".to_s
puts"  ___| |__   ___  ___ ___ ".to_s
puts" / __| '_ \\ / _ \\/ __/ __|".to_s
puts"| (__| | | |  __/\\__ \\__ \\".to_s
puts" \\___|_| |_|\\___||___/___/".to_s
puts "Created by: David Jaimes"
puts "Pirates never die."
puts ""
puts ""
puts "This is a two player game you will need a friend or at least someone to play with you."
puts "Decide amongst the two of you who is going to be white and who is going to be black."
puts ""
puts "Do you need the instructions? please enter y or n"
instructions = gets.chomp
if instructions == "y" 
	puts "For regular moves:"
	puts "	1.	Select the piece you want to move by inputing the letter then the number. "
	puts "	2.	Select the location you want the piece to move to by inputing the letter then the number."	
	puts "	note the game will warn you if your move is illegal"
	puts ""
	puts "Castling"
	puts "	1.	In the select prompt input the type of move you want to make"
	puts "		example: kings side castle will castle on the kings side"
	puts ""
	puts "		note the game will warn you if the move is illegal"	
	puts ""
	puts "	Here are the castling commands:"
	puts "		1.	king's side castle"
	puts "		2.	queen's side castle"
elsif instructions == "n"
	puts "Let's get this game started then"
else 
	puts "don't get fresh with me"
end
puts ""
puts "White please state your name:"
white = gets.chomp
puts "Black please state your name:"
black = gets.chomp
game = Chess.new
board = Board.new
board.new_game
puts ""
board.display 
puts ""
puts "your move #{white}" #white player
puts "Select a piece"
puts "input move"
puts ""
puts "BOARD GOES HERE"
puts ""
puts "your move #{black}"
puts "select a piece"
puts "input move"
puts ""
puts "BOARD GOES HERE"