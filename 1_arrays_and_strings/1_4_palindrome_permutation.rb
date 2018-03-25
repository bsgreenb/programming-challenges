# Given a string, write a function to check if it is a permutation of a palindrome.
# A palindrome is a word or phrase that is the same forwards and backwards.

# So the key here is that there's at most one odd character count

def build_char_count_array(str)
  char_count_arr = []
  str.split('').each do |char|
    char_count_arr[char.ord] ||= 0
    char_count_arr[char.ord] += 1
  end

  char_count_arr
end

def palindrome_permutation(str)
  str.gsub!(' ', '') # ignore spaces
  char_count_array = build_char_count_array(str).compact
  has_odd_count = false

  char_count_array.each do |char_count|
    if char_count.odd?
      if has_odd_count
        return false
      else
        has_odd_count = true
      end
    end
  end

  return true
end

puts palindrome_permutation('tact coa')
