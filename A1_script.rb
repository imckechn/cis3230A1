require_relative "classes/Randomizer" 
require_relative "classes/Coin" 

puts "Creating the randomize object with default face count"
randomizer = Randomizer.new()
puts "Succeeded"

puts "Creating the randomizer object with less than two faces"
randomizer = Randomizer.new(0)
puts "Succeeded"


puts "Creating the randomizer object with more than two faces"
randomizer = Randomizer.new(100)
puts "Succeeded"

puts "Calling 'calls' function"
call_count = randomizer.calls()
puts "Succeeded"


puts("Calling the randomize function")
answer = randomizer.randomize()
puts "Succeeded"


puts "Calling result to see result"
answer = randomizer.results();
puts "Succeeded"


puts "Calling 'calls' function again"
call_count2 = randomizer.calls()
puts "Succeeded"


call_count_difference = call_count2 - call_count
puts "Call count difference = #{call_count_difference}"

puts "Current result = #{randomizer.results}"
puts "calling reset"
randomizer.reset()
puts "Current result (Should be nil) = #{randomizer.results}"

