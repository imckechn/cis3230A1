require_relative "Randomizer" 
require_relative "../constants/constants"

class Die < Randomizer

    #constructor (i.e. Die.new(sides, colour))
    def initialize(sides, colour)
        self._init()
        @sides = sides
        @colour = colour
        @item = Hash["item" => "die"]
    end

    #returns the colour of the die (does not set it)
    def colour()
        return @colour
    end

    #eturns the number of sides ( does not set it)
    def sides()
        return @sides
    end

    #randomizes and returns self (for method chaining)
    #is a synonym for randomize()
    def roll()
        self.randomize()
        return self
    end

    #returns 1..sides or nil
    #is a synonym for result()
    def sideup()
        answer = self.results()

        if answer == nil
            return nil
        else
            return self.results() + 1
        end
    end

end
