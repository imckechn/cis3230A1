require_relative "constants/constants"

require_relative "classes/Randomizer" 
require_relative "classes/Die"
require_relative "classes/Coin" 
require_relative "classes/Hand"
require_relative "classes/RandomizerContainer"
require_relative "classes/Cup"
require_relative "classes/Results"




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

fail_counter = 0

#------ TESTING THE RANDOMIZER OBJECT ---------
puts "\n\nTESTING THE RANDOMIZER OBJECT"


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
    fail_counter += 1
end


puts "Calling randomize on the randomzier object"
puts "We havent set a side count on it so it should return false"
randomizer_return = randomizer.randomize()

if randomizer_return
    puts "Failed"
    fail_counter += 1
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
    fail_counter += 1
end
puts "\nThere were #{fail_counter} failure(s) in this section."


#------ TESTING THE DIE OBJECT ---------
puts "\n\nTESTING THE DIE OBJECT"

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
    fail_counter += 1
end

puts "Calling the sides function on the die object"
puts "This should return the sides we set"
sides = die.sides()
if sides == 6
    puts "Succeeded"
else
    puts "Failed"
    fail_counter += 1
end

puts "Calling the roll() function, should return self on success"
die.roll()
puts "Succeeded since it didnt crash and returns self"

puts "Calling the result() function, should return the result of the roll"
result = die.sideup()
if result == nil
    puts "Failed, retults are nil"
    fail_counter += 1

elsif result > 0 && result < 7
    puts "Succeeded"
else
    puts "Failed"
    fail_counter += 1
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
    fail_counter += 1
end

puts "Getting the number of faces on the die"
puts "This should return the number of faces we set"
num_faces = die.get_num_faces()
if num_faces == 6
    puts "Succeeded"
else
    puts "Failed"
    fail_counter += 1
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
    fail_counter += 1
end

puts "\nThere were #{fail_counter} failure(s) in this section."



#------ TESTING THE COIN OBJECT ---------
puts "\n\nTESTING THE COIN OBJECT"

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
    fail_counter += 1
end

puts "Calling the flip() function, should return self on success"
coin.flip()
puts "Succeeded since it didnt crash and returns self"

puts "Calling the result() function, should return the result of the flip"
result = coin.sideup()
if result == nil
    puts "Failed, retults are nil"
    fail_counter += 1

elsif result == :H || result == :T
    puts "Succeeded"
else
    puts "Failed"
    fail_counter += 1
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
    fail_counter += 1
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
    fail_counter += 1
end

puts "\nThere were #{fail_counter} failure(s) in this section."



#------ TESTING THE RANDOMIZER CONTAINER OBJECT ---------
puts "\n\nTESTING THE RANDOMIZER CONTAINER OBJECT"

puts "Initializing the randomizerContianer. This should not crash"
randomizerContainer = RandomizerContainer.new()

puts "Getting the number of randomizers in the container"
puts "This should return 0"
num_randomizers = randomizerContainer.count()
if num_randomizers == 0
    puts "Succeeded"
else
    puts "Failed"
    fail_counter += 1
end

puts "Adding a randomizer to the container"
puts "This should not crash"
randomizerContainer.store(randomizer)
puts "Succeeded"

puts "Getting the number of randomizers in the container"
puts "This should return 1"
num_randomizers = randomizerContainer.count()
if num_randomizers == 1
    puts "Succeeded"
else
    puts "Failed"
    fail_counter += 1
end

puts "Adding a list of randomizers of length 2 to the container"
puts "This should not crash"
randomizerContainer.store_all([coin, die])
puts "Succeeded"

puts "\nThere were #{fail_counter} failure(s) in this section."


#------ TESTING THE HAND OBJECT ---------
puts "TESTING THE HAND OBJECT"

puts "Initializing the hand. This should not crash"
hand = Hand.new()
puts "Succeeded"

puts "Getting the number of ranomizers in the hand"
puts "This should return 0"
num_randomizers = hand.count()
if num_randomizers == 0
    puts "Succeeded"
else
    puts "Failed"
    fail_counter += 1
end

puts "Adding a randomizer to the hand"
puts "This should not crash"
hand.store(randomizer)
puts "Succeeded"

puts "Getting the number of randomizers in the hand"
puts "This should return 1"
num_randomizers = hand.count()
if num_randomizers == 1
    puts "Succeeded"
else
    puts "Failed"
    fail_counter += 1
end

puts "Getting the randomizer back from the hand"
puts "This will return the randomizer we added"

new_randomizer = hand.next()

if new_randomizer.get_description() == randomizer.get_description()
    puts "Succeeded"
else
    puts "Failed"
    fail_counter += 1
end

puts "Adding 3 randomizers to the hand, then confirming we get them back in the order we put them in"
hand.store_all([randomizer, die, coin])

randomizer_a = hand.next()
randomizer_b = hand.next()
randomizer_c = hand.next()
randomizer_nil = hand.next()

if randomizer_a.get_description() == coin.get_description()
    if randomizer_b.get_description() == die.get_description()
        if randomizer_c.get_description() == randomizer.get_description()
            if randomizer_nil == nil
                puts "Succeeded, returned each item in order, finishing with nil"
            else
                puts "Failed"
                fail_counter += 1
            end
        else
            puts "Failed"
            fail_counter += 1
        end
    else
        puts "Failed"
        fail_counter += 1
    end
else
    puts "Failed on coin, got #{randomizer_a.get_description()}"
    fail_counter += 1
end

puts "Adding a randomizer to the hand, empyting the hand, then confirming we get nil back and the hand is empty"
hand.store(randomizer)

answer = hand.empty()
if answer == nil
    puts "Succeeded in getting nil back from emptying the hand"
else
    puts "Failed"
    fail_counter += 1
end

answer = hand.next()
if answer == nil
    puts "Succeeded in getting nil back from calling next on an empty hand"
else
    puts "Failed"
    fail_counter += 1
end

puts "\nThere were #{fail_counter} failure(s) in this section."


#------ TESTING THE RESULTS OBJECT ---------
puts "TESTING THE RESULTS OBJECT"
cup = Cup.new()

puts "Initializing the results. This should not crash"
results = Results.new(cup)
puts "Succeeded"

# Need to test the description feature

puts "Storing 3 randomizers in the results object"

results_array = []
randomizer.randomize()
randomizer_results = randomizer.results()
results_array.push(randomizer_results)

die.randomize()
die_results = die.results()
results_array.push(die_results)

coin.randomize()
coin_results = coin.results()
results_array.push(coin_results)

results.store(randomizer)
results.store(die)
results.store(coin)
puts ("Succeeded in storing 3 randomizers")

puts "Now getting the results of all the randomizers"
puts "The results of the randomizers before adding them to the array were: #{results_array} so it will succeeed if it returns the same thing"
results_from_results = results.results()

if results_from_results == results_array
    puts "Succeeded"
else
    puts "Failed"
    fail_counter += 1
end

puts "Testing the sum method"
puts "The sum should only be equal to the the sum of all the results"
puts "Randomizer results: #{randomizer.results()}"

sum_results = results.sum()
if sum_results == (coin.results() + die.results() + randomizer.results())
    puts "Succeeded"
else
    puts "Failed"
    fail_counter += 1
end


puts "Testing the Tally method"
puts "The tally should only be equal to the number of coins the results object(1_"
tally_results = results.tally()
if tally_results == 1
    puts "Succeeded"
else
    puts "Failed"
    fail_counter += 1
end



puts "Adding a good description to the array and making sure it returns the coin object results"
results.description(coin.get_description())
results_from_results = results.results()
if results_from_results == [coin.results()]
    puts "Succeeded"
else
    puts "Failed"
end


puts "Testing the sum method"
puts "The sum should only be equal to the coins results"
sum_results = results.sum()
if sum_results == coin.results()
    puts "Succeeded"
else
    puts "Failed"
    fail_counter += 1
end


puts "Testing the Tally method"
puts "The tally should only be equal to the number of coins the results object(1_"
tally_results = results.tally()
if tally_results == 1
    puts "Succeeded"
else
    puts "Failed"
    fail_counter += 1
end



#------ TESTING THE CUP OBJECT ---------
puts "TESTING THE CUP OBJECT"

puts "Initializing the cup. This should not crash"
cup = Cup.new()




#------ TESTING THE BAG OBJECT ---------
puts "TESTING THE BAG OBJECT"



#------ TESTING THE PLAYER OBJECT ---------
puts "TESTING THE PLAYER OBJECT"


#------ RUNNING TEST GAME SCENARIO 1 ---------
puts "TESTING THE PLAYER OBJECT"


#------ RUNNING TEST GAME SCENARIO 2 ---------


#------ RUNNING TEST GAME SCENARIO 3 ---------


#------ FINAL READOUT ---------
puts "\n\nTESTING COMPLETE"
puts "There were #{fail_counter} failure(s)."
