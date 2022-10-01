class RandomizerContainer

    def initialize()
        self._init()
    end

    def _init()
        @randomizerList = []
        @item = Hash["item" => "randomizerContainer"]
    end

    #stores a randomizer in the container
    #returns self (for method chaining)
    def store(r)
        @randomizerList.push(r)
        return self
    end

    #stores all randomizers from a list
    #returns self (for method chaining)
    def store_all(l)
        @randomizerList.concat(l)
        return self
    end

    #returns the count of all randomizer stored in itself
    def count()
        if (@randomizerList == nil)
            return 0
        else 
            return @randomizerList.length
        end
    end

    #remove each randomizer in rc & store it in self
    #returns self (for method chaining)
    def move_all(rc:RandomizerContainer)
        @randomizerList.concat(rc.get_all())
        return self
    end

    def get_all()
        return @randomizerList
    end

    #abstract method that should remove all members from the container
    def empty()
        @randomizerList = []
        return self
    end


    #selects items based on the description provided (see the section on descriptions on pg. 5)
    #remove the selected items from self;
    #returns a Hand object that holds the selected items up to the number entered into amount
    #(if you want all items, supply the symbol :all instead of a number
    #def select(description:Hash, amt=:all)
    def select(description, amt=:all)

        counter_amount = 0
        
        hand = hand.new()
        
        for random in @randomizerList
            if random.matches(description)
                hand.store(random)
                counter_amount += 1

                if amt != :all && counter_amount >= amt
                    break
                end
            end
        end
        return hand
    end
end
