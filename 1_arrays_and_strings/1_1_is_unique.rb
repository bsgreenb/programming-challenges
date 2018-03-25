# Implement an algorithm to determine if a string has all unique characters.  What if you cannot use additional data structures?

# My approach will be to sort then check for duplicates.  this doesn't require a data structure for storage.
# If we were using a data structure, we could could have an ASCII array or bools, or even a bit vector if I knew that shit.

def has_unique_chars(str)
  previous_char = nil
  str.split('').sort.each do |char|
    if char == previous_char
      return false
    end
    previous_char = char
  end

  true
end

puts has_unique_chars('blah')
puts has_unique_chars('bblah')
