require "rspec"
require_relative '../lib/deck.rb'

describe Deck do
    it 'creates a single deck' do
        new_deck = Deck.new(1)
        expect(new_deck.size).to eq(52)
    end

    it 'creates a double deck' do
        new_deck = Deck.new(2)
        expect(new_deck.size).to eq(104)
    end
end
