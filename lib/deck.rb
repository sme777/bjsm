require_relative './utils.rb'
require_relative './card.rb'

class Deck
    attr_accessor :decks

    def initialize(deck_count)
        @deck_count = deck_count
        @organized_deck = organized_deck
        @decks = random_deck
    end

    def organized_deck
        decks = []
        @deck_count.times do |_|
            Deck.suits.each do |suit|
                Deck.cards.each do |face|
                    decks << Card.new(face, suit)   
                end
            end
        end
        decks
    end


    def random_deck
        deck = Utils.clone(@organized_deck)
        random_deck = []
        while deck.size > 0
            index = (rand * deck.size).floor
            random_deck << deck[index]
            deck.delete_at(index)
        end
        random_deck
    end

    def size
        @decks.size
    end

    def self.cards
        ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
    end
    
    def shift
        @decks.shift
    end

    def self.suits
        ["D", "S", "C", "H"]
    end
end