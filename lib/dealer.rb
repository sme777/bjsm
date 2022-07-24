class Dealer
    attr_accessor :cards
    
    def initialize
        @cards = []
    end

    def move(hand_count)
        hand_count < 17 ? :hit : :stand
    end
end