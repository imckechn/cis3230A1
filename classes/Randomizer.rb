class Randomizer

    def initialize()
        self._init()
    end


    def _init()
        @has_been_rolled = false
        @roll_value = nil
        @call_count = 0
        @description = nil
        @sides = -1
        @item = nil
    end



    #both randomizes as well as returns self (for method chaining)
    def randomize()
        if @sides == -1
            return false
        end

        @has_been_rolled = true
        @call_count += 1

        @roll_value = rand(0..@sides - 1)

        return true
    end

    #returns the result of the randomization, or nil if never randomized
    def results()
        if @has_been_rolled == false
            return nil
        else
            return @roll_value
        end
    end


    #returns the number of randomizations performed
    def calls()
        return @call_count
    end

    #sets the result to nil and number of randomizations performed to 0
    #returns self (for method chaining)
    def reset()
        @has_been_rolled = false
        @roll_value = nil
    end

    def get_num_faces()
        return @sides
    end

    def set_description(description)
        @description = description
    end
    
    def get_description()
        return @description
    end

    #Check if the description given matches the one in the randomizer, if so return true
    def matches(descriptionArg:Hash)

        keys_matched_counter = 0

        if @description == nil
            return true
        else
            for key in @description.keys   #Loop through all keys in self.description
                if sdescriptionArg.keys.include? key  #if the key is in the description arg
                    if descriptionArg[key] != @description[key]   #check if the values match, if not return false
                        return false
                    end
                    
                    keys_matched_counter += 1    #For every match, increase counter by one
                end
            end
        end

        if keys_matched_counter == descriptionArg.keys.length
            return true #if it gets here, it means that all the keys in the description arg are in the randomizer description and the values match
        else
            return false
        end
    end
end

