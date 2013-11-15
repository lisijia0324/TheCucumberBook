Feature: Tic Tac Toe Game
	Use Cucumber::Ast::Table to create tic.tac.toe game
		
Scenario: Player make a move to raw 2 column 1
	Given A board like this:
		| |1|2|3|
		|1| | | |
		|2| | | |
		|3| | | |
	When Player X plays in row 2, column 1
	Then The board should look like this:
		| |1|2|3|
		|1| | | |
		|2|x| | |
		|3| | | |