 # frozen_string_literal: false

### Tic Tac Toe, played in command line###

# Player Class
class Player
  attr_accessor :name, :symb

  def initialize(name, symb)
    @name = name
    @symb = symb
  end
end

# The Game
class Game < Player
  attr_accessor :board
  def initialize
    @board = initial_board
    @player_one = make_player_one
    @player_two = make_player_two
    @current_player = @player_one
  end

  def make_player_one
    puts
    puts "P1 enter name"
    player_name = gets.chomp
    player = Player.new(player_name, 'X')
    puts "Welcome #{player.name}, you'll be #{player.symb}"
    @choices = []
    player
  end

  def make_player_two
    puts
    puts "P2 enter name"
    player_name = gets.chomp
    player = Player.new(player_name, 'O')
    puts "Welcome #{player.name}, you'll be #{player.symb}"
    @choices = []
    player
  end

  def initial_board
    "
    1 | 2 | 3
    4 | 5 | 6
    7 | 8 | 9"
  end

  def switch_player
    if @current_player == @player_one
      @current_player = @player_two
    elsif @current_player == @player_two
      @current_player = @player_one
    end
  end

  def new_board
    board.gsub!(/["#{player_choice}"]/, "#{@current_player.symb}")
  end

  def logic
    puts initial_board
    until check_victory
      @board = @board.gsub(/["#{player_choice}"]/, "#{@current_player.symb}")
      puts @board
      check_victory
      switch_player
    end
  end

  def player_choice
    puts "#{@current_player.name} Pick a square via a corresponding number 1-9."
    choice = gets.to_i
    player_one_choices
    player_two_choices
    if choice.between?(1, 9) && !@choices.include?(choice)
      @choices.push(choice)
      choice
    else
      player_choice
    end
  end

  def player_one_choices
    @choices.select.with_index { |_, i| i.even? }.sort
  end

  def player_two_choices
    @choices.select.with_index { |_, i| i.odd? }.sort
  end

  def match(arry)
    arry.all? { |c| player_one_choices.include?(c) }
  end

  def match2(arry)
    arry.all? { |c| player_two_choices.include?(c) }
  end

  def check_victory
    # Horizontal
    array2 = [1, 2, 3]
    array3 = [4, 5, 6]
    array4 = [7, 8, 9]

    # Diagonal
    array5 = [1, 5, 9]
    array6 = [3, 5, 7]

    # Vertical
    array7 = [1, 4, 7]
    array8 = [2, 5, 8]
    array9 = [3, 6, 9]

    if match(array2) || match2(array2) == true
      puts "#{@current_player.name} You've defeated the cruel overlord. Now a whole new wave of cruelty may wash over the land!"
      new_game
    elsif match(array3) || match2(array3) == true
      puts "#{@current_player.name} is victorious! Hooray!"
      new_game
    elsif match(array4) || match2(array4) == true
      puts "It's all over here,#{@current_player.name} has won again...there are people milling around, they are delirious with joy and I'm sure there is delirium down in#{@current_player.name}'s dressing room."
      new_game
    elsif match(array5) || match2(array5) == true
      puts "#{@current_player.name} smells like Victory."
      new_game
    elsif match(array6) || match2(array6) == true
      puts "#{@current_player.name} wins.  Fatality."
      new_game
    elsif match(array7) || match2(array7) == true
      puts "#{@current_player.name} wins!! I have been to the Great Wall of China. I have seen the Pyramids of Egypt...But never in all my years have I witnessed something as impossible as what we've witnessed here."
      new_game
    elsif match(array8) || match2(array8) == true
      puts "#{@current_player.name} wins!"
      new_game
    elsif match(array9) || match2(array9) == true
      puts "Congratulations#{@current_player.name} You've won!"
      new_game
    elsif @choices.length == 9
      puts "All right! We'll call it a draw."
      new_game
    end
  end

  def new_game
    puts "Would you like to play again? Y/N"
    answer =  gets.chomp.downcase
    if answer == "y"
      game = Game.new
      game.logic
    else
      exit
    end
  end

  def draw
    return unless @choices.length == 9

    puts "All right, we'll call it a draw."
  end
end

game = Game.new
game.logic
