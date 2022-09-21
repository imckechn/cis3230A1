require_relative 'bag'

class Player

    #Class Variables
    @@name = nil
    @@bag = bag.new()
    @@cup = cup.new()
    @@throw_results = nil

    #constructor (ie Player.new("gandalf")"))
    def initialize(name:String)
        @@name = name
    end

    #returns the name of the player (does not set it)
    def name()
        return @@name
    end

    #stores the item in the player’s bag
    #returns self (for method chaining
    def store(item:Randomizer)
        @@bag.store(item)
        return self
    end

    #gets each item in randomizerContainer and stores it in the player’s bag
    #returns self (for method chaining)
    def move_all(rc:RandomizerContainer)
        bag.move_all(rc)
    end

    #loads items from the player’s bag to the player’s cup based on the description
    #returns self (for method chaining)
    def load(description:hash = { })

        for random in @@bag.select(description)
            @@cup.store(random)
        end

        return self
    end

    #throws the (loaded) cup
    #store and return the results of the “thrown items” (which are still stored in the cup)
    def throw()
        @@throw_results.push(@@cup.throw())

        return @@throw_results
    end

    #replaces the items selected by the description from the cup into the bag
    #returns self (for method chaining)
    def replace(description:hash = { })

        for random in @@cup.select(description)
            @@bag.store(random)
        end

        return self
    end

    #clears all stored results
    #returns self (for method chaining)
    def clear()
        @@throw_results = []
        return self
    end

    #sets the description, and calls tally() on each of the stored results
    #and returns each of the values within a single array
    def tally(description:hash = { })

        for random in @@throw_results
            random.set_description(description)
        end

        



    end

    #sets the description, and calls sum() on each of the stored results
    #and returns the combined values as an array
    def sum(description:hash = { })
    end

    #sets the description and returns the result values as an array,
    #where the last Results is “throw=0”, the throw before is “throw=1”, etc.
    #If a throw is requested that doesn’t exist (too far back in time and never occurred), return nil
    #Here a “throw” is short for “the result of a given throw”
    def results(description:hash = { }, throw:Int = 0)
    end


end
