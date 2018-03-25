# Given two strings, write a method to decide if one is a permutation of the other.

# Ok, so things are permutations of each other if they have the same characters.
# The approach here will be to

def build_char_count_array(str)
  char_count_arr = []
  str.split('').each do |char|
    char_count_arr[char.ord] ||= 0
    char_count_arr[char.ord] += 1
  end

  char_count_arr
end

def check_permutation(str1, str2)
  return build_char_count_array(str1) == build_char_count_array(str2)
end

puts check_permutation('abcd', 'dcba')
puts check_permutation('abcde', 'dcba')
