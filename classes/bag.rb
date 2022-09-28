require_relative "RandomizerContainer"
require_relative "hand"

class bag < randomizerContainer

    #empties all items from the Bag into a Hand, which is returned
    def empty(hand:Hand)
        hand.store_all(@@randomizerList)
        @@randomizerList = []
        return self
    end
end
