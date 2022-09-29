require_relative "Randomizer" 
require_relative "../constants/constants"

class Coin < Randomizer
    @denomination = nil

    #constructor (i.e. Coin.new(denomination))
    def initialize(denomination:Enum)
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
        randomize()
        return self
    end

    #returns :H or :T (the result of the last flip) or nil (if no flips yet done)
    #is a synonym for result()
    def sideup()
        if result == 1
            return "heads"
        else
            return "tails"
        end
    end
end