require "rspec"
require_relative '../lib/card.rb'

describe Card do
    it 'creates a single card' do
        new_deck = Card.new("A", "S")
        expect(new_deck.to_s).to eq("AS")
    end

    it 'check card value is negative' do
        new_deck = Card.new("A", "S")
        expect(new_deck.value).to eq(-1)
    end

    it 'check card value is positive' do
        new_deck = Card.new("3", "D")
        expect(new_deck.value).to eq(1)
    end

    it 'check card value is zero' do
        new_deck = Card.new("7", "H")
        expect(new_deck.value).to eq(0)
    end
end