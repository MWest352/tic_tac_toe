# frozen_string_literal: true

### Tic Tac Toe, played in command line###

# Player Class
class Player
  attr_accessor :name, :symb

  def initialize(name, symb)
    @name = name
    @symb = symb
  end
end