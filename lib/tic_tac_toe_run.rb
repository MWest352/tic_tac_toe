# frozen_string_literal: true

### Tic Tac Toe, played in command line###
require_relative './tic_tac_toe_player.rb'
require_relative './tic_tac_toe.rb'

def player_one
  puts
  puts "Player One, Please enter your name:"
  player_name = gets.chomp
  player = Player.new(player_name, 'X')
  puts "Welcome #{player.name}, you'll be #{player.symb}"
  @player_one = player
  @player_one
end

def player_two
  puts
  puts "Player Two, Please enter your name:"
  player_name = gets.chomp
  player = Player.new(player_name, 'O')
  puts "Welcome #{player.name}, you'll be #{player.symb}"
  @player_two = player
  @player_two
end

game = Game.new(player_one, player_two)
game.logic