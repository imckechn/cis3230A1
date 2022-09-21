class Randomizer
    @@status = nil
    @@has_been_rolled = false
    @@roll_value = nil
    @@call_count = 0
    @@num_faces = 0
    @@description = nil

    def randomize()
        @@has_been_rolled = true
        @@call_count += 1

        @@roll_value = rand(1..@@num_faces)
    end


    def results()
        if @@has_been_rolled == false
            return nil
        else
            return @@roll_value
        end
    end


    def calls()
        return @@call_count
    end


    def reset()
        @@has_been_rolled = false
        @@roll_value = nil
    end

    def get_num_faces()
        return @@num_faces
    end

    def set_description(description:Hash)
        @@description = description
    end
    
    def get_description()
        return @@description
    end
end

