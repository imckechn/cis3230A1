require_relative "RandomizerContainer"
require_relative "Hand"

class Bag < RandomizerContainer

    def initialize()
        #Item specifies the name of the object
        @item = Hash["item" => "bag"]
    end

    #empties all elements from the Bag into a Hand, which is returned
    def empty(hand)
        hand.store_all(@randomizerList)
        @randomizerList = []
        return self
    end
end
