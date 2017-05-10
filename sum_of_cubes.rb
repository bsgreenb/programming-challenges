require 'Prime'
# a^3 + b^3 = c^3 + d^3 .  find all a, b, c, d where 1 < N < 100
# let A = (a^3 + b^3 )
# let B = (c^3 + d^3)
# Really these are both the space of all (n1^3 + n2^3) that we need to loop through.
# So we want to produce all the posible cubes, and just combine the arrays.
sums_of_cubes = {}

# review enumerations and looping via ruby.  here what i want is a loop I can start at 1.  starting at an n matters.
d = 3

N = 10000
(1..N).each do |a|
  (1..N).each do |b|
    next unless Prime.prime?(a) && Prime.prime?(b)
    result = (a**d) + (b**d)
    sums_of_cubes[result] ||= []
    sums_of_cubes[result].push([a, b])
  end
end


sums_of_cubes.each do |result, pairs|
  # Loop it on itself because it counts when they're all equal.  no exclusion
  next if pairs.length <= 2 #not interesting
  pairs.each do |pair1|
    pairs.each do |pair2|
      puts [pair1, pair2].inspect
    end
  end
end






# brute force solution would be to loop through every value of a, b, c, and d
# but we can simplify by going through every value of a^3 + b^3 and every value of c^3 + d^3
