class Card
    attr_accessor :face, :suit 

    def initialize(face, suit)
        @face = face
        @suit = suit
    end

    def value
        if face == "10" || face == "J" || face == "Q" || face == "K" || face == "A"
            -1
        elsif face.to_i < 7
            1
        else
            0
        end
    end
    
    def to_s
        "#{@face}#{@suit}"
    end
end
