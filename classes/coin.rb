require_relative "Randomizer" 

class Coin < Randomizer
    @@denomination = nil

    
    def initialize(denomination:Enum)
        @@denomination = denomination
        @@num_faces = 2
    end


    def denomination()
        return @@denomination
    end


    def flip()
        randomize()
        return self
    end


    def sideup()
        if result = 1
            return "heads"
        else
            return "tails"
        end
    end
end