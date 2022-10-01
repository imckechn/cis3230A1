require_relative "RandomizerContainer"
require_relative "Hand"

class Bag < RandomizerContainer

    def initialize()
        #Item specifies the name of the object
        @item = Hash["item" => "bag"]
        self._init()
    end

    #empties all elements from the Bag into a Hand, which is returned
    def empty()
        hand = Hand.new()
        hand.move_all(self)
        @randomizerList = []
        return hand
    end
end
