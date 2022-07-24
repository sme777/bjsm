require_relative './strategy.rb'

class Player
    attr_accessor :cards

    def initialize(deviations, bet_spread, bankroll, game)
        @deviations = deviations
        @bet_spread = bet_spread
        @bankroll = bankroll
        @game = game
        @cards = []
    end

    def bet
        true_count = @game.current_count / @game.deck_size
        bet = 0
        if @bet_spread == "1-8"
            bet = true_count > 0 ? Math.min(true_count.floor, 8) * @game.minimum_bet : @game.minimum_bet
        end
        bet
    end

    def move(cards)
        dealer_card = cards[:dealer]
        player_cards = cards[:player]
        if will_deviate?
            @deviations.move(dealer_card, player_cards)
        else
            if soft_hand?(player_cards) 
                move = Strategy::BASIC[:soft]["A#{residual_count(player_cards)}-#{dealer_card.face}"]
            elsif split_hand?(player_cards)
                move = Strategy::BASIC[:split]["#{player_cards.first.face}-#{dealer_card.face}"]
            else
                current_hand_count = hand_count(player_cards)
                if current_hand_count < 8
                    move = :hit
                else
                    move = Strategy::BASIC[:hard]["#{current_hand_count}-#{dealer_card.face}"]
                end
            end
            move
        end

    end

    def soft_hand?(cards)

    end

    def split_hand?(cards)
        cards.size == 2 && cards.first.face == cards.last.face
    end

    def hand_count(cards)
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

    def will_deviate?
        false
    end
end