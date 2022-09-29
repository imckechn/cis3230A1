require_relative "constants/constants"

require_relative "classes/Randomizer" 
require_relative "classes/Die"
require_relative "classes/Coin" 
#require_relative "classes/Player"
#require_relative "constants/Randomizer_Enum"
#require_relative "constants/Denominations"
#require_relative "constants/Die_colours"
#require_relative "constants/Coin_sides"





#----------------------------- 
#   TO DO

# Figure out the tally, sum, and results functions in player.rb
# Figure out what the emuns are for in the constants file
# Fix Ruby style guide violations
# Make sure program is to 'OO' standards
# Finish testgames.rb file
# Create 5 use cases for the program
#Figure out better way to do the _init method in randomizer

#-----------------------------


#------ TESTING THE RANDOMIZER OBJECT ---------
puts "TESTING THE RANDOMIZER OBJECT"


puts "Creating the randomize object with default face count"
puts "Measurement of success will be not crashing"
randomizer = Randomizer.new()
puts "Succeeded"

puts "Check the number of randmizations performed, should be zero"
call_count = randomizer.calls()
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

puts "Creating a die object with 6 sides and a red colour"
puts "Measurement of success will be not crashing as init doesnt return anything"
die = Die.new(6, Die_colours[1])    #These enums need to be changed
puts "Succeeded"

puts "Calling the colour function on the die object"
puts "This should return the colour we set"
colour = die.colour()
if colour == Die_colours[1]
    puts "Succeeded"
else
    puts "Failed"
end

puts "Calling the sides function on the die object"
puts "This should return the sides we set"
sides = die.sides()
if sides == 6
    puts "Succeeded"
else
    puts "Failed"
end

puts "Calling the roll() function, should return self on success"
die.roll()
puts "Succeeded since it didnt crash and returns self"

puts "Calling the result() function, should return the result of the roll"
result = die.sideup()
if result == nil
    puts "Failed, retults are nil"

elsif result > 0 && result < 7
    puts "Succeeded"
else
    puts "Failed"
end

puts "Calling the set_description() function, should set the description of the die"
puts "This wont return anything so it will only fail if it crashes"
die.set_description({'item' => 'die'})
puts "Succeeded"

puts "Calling the description() function, should return the description of the die"
description = die.get_description()
if description['item'] == 'die'
    puts "Succeeded"
else
    puts "Failed"
end

puts "Getting the number of faces on the die"
puts "This should return the number of faces we set"
num_faces = die.get_num_faces()
if num_faces == 6
    puts "Succeeded"
else
    puts "Failed"
end

puts "Calling the reset() function, should reset the die"
puts "This wont return anything so it will only fail if it crashes"
die.reset()
puts "Succeeded in calling reset"

puts "Checking that it reset the die by asking for results"
puts "This should return nil"
result = die.sideup()
if result == nil
    puts "Succeeded"
else
    puts "Failed"
end



#------ TESTING THE COIN OBJECT ---------
puts "TESTING THE COIN OBJECT"

puts "Creating a coin object with a denomination of 50 cents"
puts "Measurement of success will be not crashing as init doesnt return anything"
coin = Coin.new(Denominations["0.05"])    #These enums need to be changed
puts "Succeeded"

puts "Getting the demonination of the coin"
puts "This should return the demonination we set"
denomination = coin.denomination()
if denomination == Denominations["0.05"]
    puts "Succeeded"
else
    puts "Failed"
end

puts "Calling the flip() function, should return self on success"
coin.flip()
puts "Succeeded since it didnt crash and returns self"

puts "Calling the result() function, should return the result of the flip"
result = coin.sideup()
if result == nil
    puts "Failed, retults are nil"

elsif result == :H || result == :T
    puts "Succeeded"
else
    puts "Failed"
end

puts "Calling the set_description() function, should set the description of the coin"
puts "This wont return anything so it will only fail if it crashes"
coin.set_description({'item' => 'Nickel'})
puts "Succeeded"

puts "Calling the get_description() function, should return the description of the coin"
description = coin.get_description()
if description['item'] == 'Nickel'
    puts "Succeeded"
else
    puts "Failed"
end

puts "Calling the reset() function, should reset the coin"
puts "This wont return anything so it will only fail if it crashes"
coin.reset()
puts "Succeeded in calling reset"

puts "Checking that it reset the coin by asking for results"
puts "This should return nil"
result = coin.sideup()
if result == nil
    puts "Succeeded"
else
    puts "Failed, it returned #{result}"
end


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


