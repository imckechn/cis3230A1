require_relative "Bag"
require_relative "Cup"

class Player    

    #constructor (ie Player.new("gandalf")"))
    def initialize(name)
        @name = name
        @bag = Bag.new()
        @cup = Cup.new()
        @throw_results = nil
        @throw_results_array = []
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
        swap_based_on_description(description, @bag, @cup)
        return self
    end

    #replaces the items selected by the description from the cup into the bag
    #returns self (for method chaining)
    def replace(description)
        swap_based_on_description(description, @cup, @bag)
        return self
    end


    #Swaps items between the old and new containers based on the description
    #If randomizers match the description they get moved, if they dont have a description they'll get moved
    def swap_based_on_description(description, old_container, new_container)
        hand = old_container.empty()
        randomizer_object = hand.next()
    
        while randomizer_object != nil
            if randomizer_object.matches(description)
                new_container.store(randomizer_object)
            else
                old_container.store(randomizer_object)
            end
            
            randomizer_object = hand.next()
        end

        return self
    end


    #Gets the number of randomizers in cup
    def get_num_objects_in_cup()
        return @cup.count()
    end


    #Gets all the objects the player has on them (Their bag and cup)
    def get_all_objects_player_has()
        return @bag.count() + @cup.count()
    end


    #throws the loaded cup
    #store and return the Results (object) of the “thrown items” (which are still stored in the cup)
    def throw()
        @throw_results = @cup.throw()
        @throw_results_array.push(@throw_results)
        return @throw_results
    end

    
    #clears all stored results
    #returns self (for method chaining)
    def clear()
        @throw_results = nil
        @throw_results_array = []
        return self
    end

    #sets the description, and calls tally() on each of the stored results
    #and returns each of the values within a single array
    def tally(description)
        results_array = []
        
        for result in @throw_results_array
            result.description(description)
            results_array.push(result.tally())
        end

        return results_array
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

        for random in @throw_results_array
            random.description(description)
        end

        

        return results_array
    end
end
