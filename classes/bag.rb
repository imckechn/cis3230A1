require_relative "RandomizerContainer"
require_relative "hand"

class bag < randomizerContainer

    def empty(hand:Hand)
        hand.store_all(@@randomizerList)
        @@randomizerList = []
        return self
    end
end
