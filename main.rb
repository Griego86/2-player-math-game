require_relative 'game'

puts "Welcome to the Math Game!"

print "Enter Player 1's name: "
player1_name = gets.chomp

print "Enter Player 2's name: "
player2_name = gets.chomp

player1 = Player.new(player1_name)
player2 = Player.new(player2_name)

game = Game.new(player1, player2)
game.start_game
