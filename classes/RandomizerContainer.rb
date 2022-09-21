class randomizerContainer

    @@randomizerList = []

    def store(r:Randomizer)
        @@randomizerList.push(r)
        return self
    end

    def store_all(l:List)
        @@randomizerList.concat(l)
        return self
    end

    def count()
        return @@randomizerList.length
    end

    def move_all(rc:RandomizerContainer)
        @@randomizerList.concat(rc.get_all())
        return self
    end

    def get_all()
        return @@randomizerList
    end

    def empty()
        @@randomizerList = []
        return self
    end

    =begin
    def select(description:Hash, amt=:all)
        for r in @@randomizerList
            if r.get_description() == description
                if amt == :all
                    @@randomizerList.delete(r)
                    return r
                else
                    amt -= 1
                end
            end
        end

        return SOMETHING
    end
    =end

    #selects items based on the description provided (see the section on descriptions on pg. 5)
    #remove the selected items from self;
    #returns a Hand object that holds the selected items up to the number entered into amount
    #(if you want all items, supply the symbol :all instead of a number
    def select (description:Hash, amt=:all)
        hand = hand.new()
        
        for random in @@randomizerList

    end




end
