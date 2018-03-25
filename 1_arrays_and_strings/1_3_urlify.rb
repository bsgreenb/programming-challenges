# Write a method to replace all spaces in a string with '%20'.  You may assume
# that the string has sufficient space at the end to hold all the additional characters,
# and that you are given the "true" length of the string.

# EXAMPLE:
# Input: "Mr John Smith   ", 13
# Output: "Mr%20John%20Smith"

# The key here was looping in reverse.

def urlify(str, true_length)
  i = true_length - 1
  write_position = str.length - 1
  while i >= 0
    char = str[i]
    if /\s/.match(char)
      str[write_position] = '0'
      str[write_position - 1] = '2'
      str[write_position - 2] = '%'
      write_position = write_position - 3
    else
      str[write_position] = char
      write_position = write_position - 1
    end
    i = i - 1
  end

  return str
end

puts urlify("Mr John Smith    ", 13).inspect
