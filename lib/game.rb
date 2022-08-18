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
        @hands = 0
        start(10000)
        puts "Finished 10,000 hands, player bankroll is #{@player.bankroll}: increased by #{@player.bankroll - 2000}"
    end

    def unpack_options(options)
        @strategy = options["strategy"]
        @deviations = options["deviations"]
        @bet_spread = options["bet_spread"]
        @insurance = options["insurance"]
        @surrender = options["surrender"]
        @deck_size = options["decks"]
        @minimum_bet = 10
    end

    def start(total_rounds)
        @cards_removed = 0
        while @cards_removed < @penetration
            wager = @player.bet
            # puts "Player wagered $#{wager}"
            # sleep(0.25)
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
            deal(@dealer, dealer_second_down_card)

            if Game.hand_count(@dealer.cards) == 21
                # puts "Dealer has a natural, player bust!"
                @dealer.bankroll += wager
                # sleep(0.25)
            end

            @cards_removed += 4
            # puts "Player cards are #{player_first_up_card.to_s} and #{player_second_up_card.to_s}"
            # sleep(0.25)
            # puts "Dealer up card is #{dealer_first_up_card.to_s}"
            # sleep(0.25)
            # byebug
            player_move = @player.move({dealer: dealer_first_up_card, player: @player.cards})
            # if Strategy::BASIC[:hard]["#{Game.hand_count(@player.cards)}-#{dealer_first_up_card.face}"] != :stand
                while player_move != :stand && player_move != :bust
                    # byebug
                    deal(@player, @deck.shift)
                    # puts "Player draws #{@player.cards.last.to_s}"
                    # sleep(0.25)
                    player_move = @player.move({dealer: dealer_first_up_card, player: @player.cards})
                    @cards_removed += 1
                end
            # end
            if player_move == :bust
                # puts "Player busts!"
                # sleep(0.25)
                # return
            else
                update_count(dealer_second_down_card)
                while Game.hand_count(@dealer.cards) < 17
                    @dealer.cards << @deck.shift
                    update_count(@dealer.cards.last)
                    @cards_removed += 1
                end

                hand_dealer_cards = Game.hand_count(@dealer.cards)
                hand_player_cards = Game.hand_count(@player.cards)
                if hand_dealer_cards > 21
                    # puts "Dealer busts, player wins #{wager}"
                    # sleep(0.25)
                    if hand_player_cards == 21 && @player.cards.size == 2
                        # puts "Player has natural, payoff 3:2!"
                        # sleep(0.25)
                        @player.bankroll += wager * 1.5
                    else
                        @player.bankroll += wager
                    end
                else
                    if hand_dealer_cards > hand_player_cards
                        # puts "Dealer wins."
                        # sleep(0.25)
                        @dealer.bankroll += wager
                    elsif hand_dealer_cards == hand_player_cards
                        # puts "It's a draw, no winners."
                        # sleep(0.25)
                    else
                        # puts "Player wins"
                        # sleep(0.25)
                        @player.bankroll += wager
                    end
                end
            end

            flush(@player)
            flush(@dealer)
            update_count(dealer_second_down_card)
            if @hands > total_rounds
                return
            end
            @hands += 1
        end
        puts "Replacing the shoe..."
        puts "Current bankroll is #{@player.bankroll}"
        # byebug
        replace_shoe
        start(10000)
    # rescue NoMethodError
    #     byebug
    # end
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
        @penetration = (rand ((@deck_size - 2) * 52)...(@deck_size * 52)) - 10
        @current_count = 0
    end

    def hand

    end

    def self.hand_count(cards)
        count = 0
        aces = 0

        cards.each do |card|
            if card.face == "10" || card.face == "J" || card.face == "Q" || card.face == "K"
                count += 10
            elsif card.face == "A"
                aces += 1
            else
                count += card.face.to_i
            end
        end

        if aces != 0
            if count + 11 + (aces - 1) < 21
                count += 11 + (aces - 1)
            else
                count += aces
            end
        end
        count
    end
end