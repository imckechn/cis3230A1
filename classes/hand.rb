require_relative 'RandomizerContainer'

class Hand < RandomizerContainer

    def initialize()
        @item = Hash["item" => "hand"]
    end

    #removes and returns the last objected added to the hand
    #if no objects are in the hand, return nil
    def next()

        if self.count() > 0
            return @randomizerList.pop()
        else
            return nil
        end

    end


    #returns nil (items are “dropped on the ground”) i.e. the pointers to the contained objects are lost (and
    #the objects will be garbage collected by the system)
    def empty()
        @randomizerList = []
        return nil
    end
end