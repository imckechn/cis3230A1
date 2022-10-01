require_relative "RandomizerContainer"
require_relative "hand"
require_relative "results"

class Cup < RandomizerContainer

    def initialize()
        @item = Hash["item" => "cup"] #Item specifies the name of the object
        self._init()
    end

    #enters each randomizer from a Hand (synonym of move_all() )
    def load(hand:Hand)
        @randomizerList.concat(hand.get_all())
        return self
    end

    #returns a Hand object to be returned to the bag, and leaves the cup empty
    def empty()
        hand = hand.new()
        empty()
        return hand
    end

    #each randomizer in the cup is rolled or flipped
    #the results of the thrown randomizers are stored in a newly created Results object, which is returned
    def throw()
        #results needs to be updated
        results = results.new()

        for r in @randomizerList
            r.randomize()
            results.store(r)
        end

        return results
    end
end
