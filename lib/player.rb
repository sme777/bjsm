require_relative './strategy.rb'
require_relative './game.rb'

class Player
    attr_accessor :cards, :bankroll

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
            bet = true_count > 0 ? [true_count.floor, 8].min * @game.minimum_bet : @game.minimum_bet
        end
        bet
    end

    def move(cards)
        dealer_card = cards[:dealer]
        player_cards = cards[:player]
        if will_deviate?
            @deviations.move(dealer_card, player_cards)
        else
            current_hand_count = Game.hand_count(player_cards)
            if current_hand_count == 21
                return :stand
            end

            if soft_hand?(player_cards) 
                move = soft_hit(player_cards, dealer_card)
            elsif split_hand?(player_cards)
                move = split_hit(player_cards, dealer_card) || hard_hit(current_hand_count, dealer_card)
            else
                if current_hand_count < 8
                    move = :hit
                elsif current_hand_count > 21
                    move = :bust
                else
                    move = hard_hit(current_hand_count, dealer_card)
                end
            end
            move
        end
    end

    def soft_hit(player_cards, dealer_card)
        move = Strategy::BASIC[:soft][:"A#{residual_count(player_cards)}-#{dealer_card.face}"]
    end

    def split_hit(player_cards, dealer_card)
        Strategy::BASIC[:split][:"#{player_cards.first.face}-#{dealer_card.face}"]
    end

    def hard_hit(current_hand_count, dealer_card)
        Strategy::BASIC[:hard][:"#{current_hand_count.to_s}-#{dealer_card.face}"]
    end

    def soft_hand?(cards)
        count = 0
        ace_flag = false
        cards.each do |card|
            if card.face == "A"
                ace_flag = true
                count += 1
            elsif card.face == "J" || card.face == "Q" || card.face == "K" 
                count += 10
            else
                count += card.face.to_i
            end
        end
        return count + 10 < 21 ? true : false
    end

    def split_hand?(cards)
        cards.size == 2 && cards.first.face == cards.last.face
    end

    def residual_count(cards)
        Game.hand_count(cards) - 11
    end

    def will_deviate?
        false
    end
end