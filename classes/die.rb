require_relative "Randomizer"

class Die < Randomizer

    # Constructor (i.e. Die.new(sides, colour))
    def initialize(sides, colour)
        super()
        @sides = sides
        @colour = colour
    end

    # Returns the colour of the die (does not set it)
    def colour
        @colour
    end

    # Returns the number of sides ( does not set it)
    def sides
        @sides
    end

    # Randomizes and returns self (for method chaining)
    # Is a synonym for randomize()
    def roll
        randomize()
        self
    end

    # Returns 1..sides or nil
    # Is a synonym for result()
    def sideup
        answer = results()

        if answer.equal?(nil)
            nil
        else
            results() + 1
        end
    end

    # To string method
    def to_s
        "Die: #{@colour}, sides = #{@sides}"
    end

end
