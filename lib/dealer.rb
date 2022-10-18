class Dealer
    attr_accessor :cards, :bankroll
    
    def initialize
        @cards = []
        @bankroll = 50000
    end

    def move(hand_count)
        hand_count < 17 ? :hit : :stand
    end
end
