require_relative "Randomizer"

class Coin < Randomizer

    # Constructor (i.e. Coin.new(denomination))
    def initialize(denomination)
        super()
        @denomination = denomination
        @sides = 2
    end

    # Returns the denomination of the coin (does not set it)
    def denomination
        @denomination
    end

    # Flips the coin
    # Returns self (for method chaining)
    # Is a synonym for randomize()
    def flip
        randomize()
        self
    end

    # Returns :H or :T (the result of the last flip)
    #   or nil (if no flips yet done)
    # is a synonym for result()
    def sideup
        result = results()

        # Heads = 1, Tails = 0
        if result.equal?(1)
            :H
        elsif result.equal?(0)
            :T
        else
            nil
        end
    end

    # To string method
    def to_s
        "Coin: #{@denomination}, sides = #{@sides}"
    end
end