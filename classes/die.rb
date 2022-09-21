require_relative "Randomizer" 

class die < Randomizer

    def initialize(sides:Int, colour:Enum)
        @@num_faces = sides
        @@colour = colour
    end

    def colour()
        return @@colour
    end

    def sides()
        return @@num_faces
    end

    def roll()
        randomize()
        return self
    end

    def sideup()
        return results()
    end

end
