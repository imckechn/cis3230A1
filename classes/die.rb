require_relative "Randomizer" 

class die < Randomizer
    @@num_faces = 0
    @@colour = nil

    #constructor (i.e. Die.new(sides, colour))
    def initialize(sides:Int, colour:Enum)
        @@num_faces = sides
        @@colour = colour
        @@item = Hash["item" => "die"]
    end

    #returns the colour of the die (does not set it)
    def colour()
        return @@colour
    end

    #eturns the number of sides ( does not set it)
    def sides()
        return @@num_faces
    end

    #randomizes and returns self (for method chaining)
    #is a synonym for randomize()
    def roll()
        randomize()
        return self
    end

    #returns 1..sides or nil
    #is a synonym for result()
    def sideup()
        return results()
    end

end
