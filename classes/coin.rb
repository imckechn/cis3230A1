require_relative "Randomizer" 
require_relative "../constants/constants"

class Coin < Randomizer

    #constructor (i.e. Coin.new(denomination))
    def initialize(denomination)
        self._init()
        @denomination = denomination
        @sides = 2
        @item = Hash["item" => "coin"] #Item specifies the name of the object
    end

    #returns the denomination of the coin (does not set it)
    def denomination()
        return @denomination
    end

    #flips the coin
    #returns self (for method chaining)
    #is a synonym for randomize()
    def flip()
        self.randomize()
        return self
    end

    #returns :H or :T (the result of the last flip) or nil (if no flips yet done)
    #is a synonym for result()
    def sideup()
        result = self.results()

        if result == 1
            return :H
        elsif result == 0
            return :T
        else
            return nil
        end
    end
end