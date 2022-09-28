class randomizerContainer

    @@randomizerList = []

    #stores a randomizer in the container
    #returns self (for method chaining)
    def store(r:Randomizer)
        @@randomizerList.push(r)
        return self
    end

    #stores all randomizers from a list
    #returns self (for method chaining)
    def store_all(l:List)
        @@randomizerList.concat(l)
        return self
    end

    #returns the count of all randomizer stored in itself
    def count()
        return @@randomizerList.length
    end

    #remove each randomizer in rc & store it in self
    #returns self (for method chaining)
    def move_all(rc:RandomizerContainer)
        @@randomizerList.concat(rc.get_all())
        return self
    end

    def get_all()
        return @@randomizerList
    end

    #abstract method that should remove all members from the container
    def empty()
        @@randomizerList = []
        return self
    end


    #selects items based on the description provided (see the section on descriptions on pg. 5)
    #remove the selected items from self;
    #returns a Hand object that holds the selected items up to the number entered into amount
    #(if you want all items, supply the symbol :all instead of a number
    def select (description:Hash, amt=:all)
        hand = hand.new()
        
        for random in @@randomizerList
            if random.matches(description)
                hand.store(random)
            end
        end
        return hand
    end
end
