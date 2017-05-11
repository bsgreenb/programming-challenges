# Two sorted distinct arrays
# Arrays same length, and all elements distinct.
# Find the number of elements in common

# [1, 2, 3, 5]
# [3, 4 5, 7]
# [7, 8 9, 10]
# I'll implement algorith that build up O(n) array, then I'll loop until I reach a number larger than the last

# Solved in O(N) time Complexity
# But unnecessary space complexity still.
def elements_in_common(arr1, arr2)
  potential_matches = {}
  arr1.each do |el|
    break if el > arr2.last
    potential_matches[el] = true
  end

  num_matches = 0
  arr2.each do |el|
    break if el > arr1.last
    num_matches += 1 if potential_matches[el]
  end

  return num_matches
end

puts elements_in_common([1,2,3], [2,3,4])

# We could do better on Space Complexity by just running two loops
