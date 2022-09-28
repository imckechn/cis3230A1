require_relative "classes/Randomizer" 
require_relative "classes/Coin" 
require_relative "classes/Player"
require_relative "classes/Die"
require_relative "classes/Coin"
require_relative "constants/randomizer_enum"
require_relative "constants/denominations"
require_relative "constants/die_colours"
require_relative "constants/coin_sides"





#----------------------------- 
#   TO DO

# The item hashes and the description need to be merged, THERE CAN ONLY BE ONE
# Figure out the tally, sum, and results functions in player.rb
# Figure out what the emuns are for in the constants file
# Fix Ruby style guide violations
# Make sure program is to 'OO' standards
# Finish testgames.rb file
# Create 5 use cases for the program

#-----------------------------


#------ TESTING THE RANDOMIZER OBJECT ---------
puts "TESTING THE RANDOMIZER OBJECT"


puts "Creating the randomize object with default face count"
puts "Measurement of success will be not crashing as there is no init function set"
randomizer = Randomizer.new()
puts "Succeeded"

puts "Check the number of randmizations performed, should be zero"
call_count = randomzier.calls()
if (call_count == 0)
    puts "Succeeded"
else
    puts "Failed"
end


puts "Calling randomize on the randomzier object"
puts "We havent set a side count on it so it should return false"
randomizer_return = randomizer.randomize()

if randomizer_return
    puts "Failed"
else
    puts "Succeeded"
end

puts "Setting the description of the randmizer to be ['item' => 'not_real']"
puts "This wont return anything so it will only fail if it crashes"
randomizer.set_description({'item' => 'not_real'})
puts "Succeeded"

puts "Calling get_description on the randomizer object"
puts "This should return the description we set"
description = randomizer.get_description()
if description['item'] == 'not_real'
    puts "Succeeded"
else
    puts "Failed"
end


#------ TESTING THE DIE OBJECT ---------
puts "TESTING THE DIE OBJECT"


#------ TESTING THE COIN OBJECT ---------
puts "TESTING THE COIN OBJECT"



#------ TESTING THE RANDOMIZER CONTAINER OBJECT ---------
puts "TESTING THE RANDOMIZER CONTAINER OBJECT"


#------ TESTING THE HAND OBJECT ---------
puts "TESTING THE HAND OBJECT"


#------ TESTING THE CUP OBJECT ---------
puts "TESTING THE CUP OBJECT"


#------ TESTING THE BAG OBJECT ---------
puts "TESTING THE BAG OBJECT"


#------ TESTING THE RESULTS OBJECT ---------
puts "TESTING THE RESULTS OBJECT"


#------ TESTING THE PLAYER OBJECT ---------
puts "TESTING THE PLAYER OBJECT"


