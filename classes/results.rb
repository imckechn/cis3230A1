class Results

    #Class variables
    @cup = nil
    @description = nil
    @results_array = []


    #constructor (i.e. Results.new(cup)
    def initialize(cup: Cup)
        @cup = cup
    end

    #Stores a description in Results from which the “randomizer” objects stored in Results (i.e. in self)
    #can be selected when computing the results, tally or sum
    def description(description:Hash)
        @description = description
        return self
    end

    #Returns an array containing the “side-up” values of the randomizers recorded in the Results (i.e. in self).
    #Only include the values from randomizers that match the description stored in the Results.
    #If description() has not yet been called, return the results from all randomizers
    def results()
        results = []

        if @description != nil
            for result in @results_array
                if result.get_description() == @description
                    results.push(result.results())
                end
            end


        else
            for result in @results_array
                results.push(result.results())
            end
        end

        return results

    end

    #Counts the items in the that match the description and returns the value
    #If description() has not yet been called, count all randomizers
    def tally()
        counter = 0

        if description == nil
            counter = @results_array.length

        else
            for result in @results_array
                if result.get_description() == @description
                    counter += 1
                end
            end
        end

        return counter
    end

    #totals the value of the randomizer items in the Results that match the description, where the value
    #equals the number that is “up” (for coins, :H = 1 and :T = 0), and returns the value
    #If description() has not yet been called, total the values across all randomizers
    def sum()
        sum = 0

        if @description == nil
            for result in @results_array
                sum += result.results()
            end

        else
            for result in @results_array
                if result.get_description() == @description
                    sum += result.results()
                end
            end
        end

        return sum
    end

    #Stores a randomizer in the Results (i.e. in self)
    def store(rand:randomizer)
        @results_array.push(rand)
    end


end
