require_relative "Bag"
require_relative "Cup"

class Player    

    #constructor (ie Player.new("gandalf")"))
    def initialize(name)
        @name = name
        @bag = Bag.new()
        @cup = Cup.new()
        @throw_results = nil
    end

    #returns the name of the player (does not set it)
    def name()
        return @name
    end

    #stores the item in the player’s bag
    #returns self (for method chaining
    def store(randomizer_item)
        @bag.store(randomizer_item)
        return self
    end

    #gets each item in randomizerContainer and stores it in the player’s bag
    #returns self (for method chaining)
    def move_all(randomizer_container)
        @bag.move_all(randomizer_container)
        return self
    end

    def get_num_randomziers()
        return @bag.count()
    end

    #loads items from the player’s bag to the player’s cup based on the description
    #returns self (for method chaining)
    def load(description)

        for object in @bag.get_all()
            
            if object.matches(description)
                @cup.store(object)
                @bag.remove(object)
            end
        end

        return self
    end

    def get_num_objects_in_cup()
        return @cup.count()
    end

    #throws the (loaded) cup
    #store and return the results of the “thrown items” (which are still stored in the cup)
    def throw()
        @throw_results.push(@cup.throw())
        return @throw_results
    end

    #replaces the items selected by the description from the cup into the bag
    #returns self (for method chaining)
    def replace(description)

        for object in @cup.get_all()
            
            if object.matches(description)
                @bag.store(object)
                @cup.remove(object)
            end
        end

        return self
    end

    #clears all stored results
    #returns self (for method chaining)
    def clear()
        @throw_results = []
        return self
    end

    #sets the description, and calls tally() on each of the stored results
    #and returns each of the values within a single array
    def tally(description)
        total_tally = 0

        for random in @throw_results
            random.set_description(description)

            total_tally += random.tally()
        end

        return total_tally
    end

    #sets the description, and calls sum() on each of the stored results
    #and returns the combined values as an array
    def sum(description)

        results_sum = 0

        for random in @throw_results
            random.set_description(description)

            results_sum += random.sum()
        end

        return results_sum
    end

    #Sets the description and returns the result values as an array,
    #where the last Results is “throw=0”, the throw before is “throw=1”, etc.
    #If a throw is requested that doesn’t exist (too far back in time and never occurred), return nil
    #Here a “throw” is short for “the result of a given throw”
    def results(description, throw)

        results_array = []

        for random in @throw_results
            random.set_description(description)            
        end
    end
end
