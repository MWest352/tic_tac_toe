# frozen_string_literal: true

# Tic Tac Toe Ruby Spec Tests

require './lib/tic_tac_toe'

describe Game do
  describe '#initialize' do
    # No tests needed
  end

  subject(:make_player) { described_class.new }
  describe '#make_player_one' do
    context 'when player enters name' do
      before do
        valid_input = 'John'
        allow(make_player).to receive(:gets).and_return(valid_input)
      end

      it 'recieves and displays players name' do
        message = "Welcome #{player.name}, you'll be #{player.symb}"
        expect(make_player).to receive(:puts).with(message)
        make_player.make_player_one
      end
    end
  end
end
