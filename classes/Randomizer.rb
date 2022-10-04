class Randomizer

    def initialize
        @has_been_rolled = false
        @roll_value = nil
        @call_count = 0
        @description = nil
        @sides = -1
    end

    # Both randomizes as well as returns self (for method chaining)
    def randomize
        return false if @sides.equal?(-1)

        @has_been_rolled = true
        @call_count += 1

        @roll_value = rand(0..@sides - 1)

        self
    end

    # Returns the result of the randomization, or nil if never randomized
    def results
        if @has_been_rolled.equal?(false)
            nil
        else
            @roll_value
        end
    end

    # Returns the number of randomizations performed
    def calls
        @call_count
    end

    # Sets the result to nil and number of randomizations performed to 0
    # Returns self (for method chaining)
    def reset
        @has_been_rolled = false
        @roll_value = nil

        self
    end

    def get_num_faces
        @sides
    end

    def set_description(description)
        @description = description
    end

    def get_description
        @description
    end

    # Check if the description given matches the one in the randomizer,
    #   if so return true
    def matches?(description_arg_hash)
        keys_matched_counter = 0

        if @description.equal?(nil)
            return true
        else
            # Loop through all keys in self.description
            @description.each do |key, value|
                # If the key is in the description arg
                if description_arg_hash.keys.include? key

                    # Check if the values match, if not return false
                    if description_arg_hash[key] != @description[key]
                        return false
                    end

                    # For every match, increase counter by one
                    keys_matched_counter += 1
                end
            end
        end

        # If it gets here, it means that all the keys in the description
        #   args are in the randomizer description and the values match
        if keys_matched_counter == description_arg_hash.keys.length
            true
        else
            false
        end
    end

    # To string method
    def to_s
        "Randomizer: #{@description}, sides: #{@sides}, result: #{@roll_value}"
    end
end

