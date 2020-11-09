##Importing module fron userActions.rb
require './user_actions.rb'
puts "
#####################################
Welcome to the world of PACMAN
#####################################

Please start by placing the pacman within the grid....
Note: Grid size is 5x5
Command to fix initial position on the grid is 'PLACE X,Y,F' where X and Y could be between 0 & 4 and F could take any of the four directions. You have 3 attempts. Let's get going!!!!

"
## Getting user Input and using Chomp and Split to create an Array containing the user command, x-position, y-position and facing of pacman
placeInput = gets.chomp.split(',');
Pacman.placePacman(placeInput)

