require_relative './player.rb'
require_relative './dealer.rb'
require_relative './deck.rb'
require 'byebug'
class Game
    attr_accessor :current_count, :deck_size, :minimum_bet

    def initialize(options)
        unpack_options(options)
        @player = Player.new(@deviations, @bet_spread, 2000, self)
        @dealer = Dealer.new
        @deck = Deck.new(@deck_size)
        @current_count = 0
        @penetration = rand ((@deck_size - 2) * 52)...(@deck_size * 52)
        start
    end

    def unpack_options(options)
        @strategy = options["strategy"]
        @deviations = options["deviations"]
        @bet_spread = options["bet_spread"]
        @insurance = options["insurance"]
        @surrender = options["surrender"]
        @deck_size = options["decks"]
    end

    def start
        @cards_removed = 0
        while @cards_removed < @penetration
            player_first_up_card = @deck.shift
            dealer_first_up_card = @deck.shift
            player_second_up_card = @deck.shift
            dealer_second_down_card = @deck.shift
            deal(@player, player_first_up_card)
            update_count(player_first_up_card)
            deal(@dealer, dealer_first_up_card)
            update_count(dealer_first_up_card)
            deal(@player, player_second_up_card)
            update_count(player_second_up_card)
            deal(@player, dealer_second_down_card)
            @cards_removed += 4
            player_cards = [player_first_up_card, player_second_up_card]
            player_move = @player.move({dealer: dealer_first_up_card, player: player_cards})
            while player_move != :stand || player_move != :bust
                replace_shoe if @cards_removed < @penetration
                player_cards << @deck.shift
                player_move = @player.move({dealer: dealer_first_up_card, player: player_cards})
                @cards_removed += 1
            end
            flush(@player)
            flush(@dealer)
            update_count(dealer_second_down_card)
        end
        puts "Replacing the shoe..."
        puts "Current bankroll is #{@player.bankroll}"
        replace_shoe
        start
    end

    def deal(player, card)
        player.cards << card
    end

    def flush(player)
        player.cards = []
    end
    
    def update_count(card)
        @current_count += card.value
    end

    def replace_shoe
        @deck = Deck.new(@deck_size)
        @penetration = rand ((@deck_size - 2) * 52)...(@deck_size * 52)
        @current_count = 0
    end

    def hand

    end
end