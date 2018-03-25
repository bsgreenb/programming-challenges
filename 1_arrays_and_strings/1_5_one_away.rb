# There are three types of edits that can be performed on strings: insert a character,
# remove a character, or replace a character.  Given two strings, write a function to check# if they are
# one edit or zero edits away.

# pale, ple -> true
# pales, pale -> true
# pale, bale -> true
# pale, bake -> false

# I think the way to handle it may be to allow for skipping ahead in the circumstance where one is longer than the other.
# As soon as there are two differences, it should quit.

def is_one_away(str1, str2)
  i = 0
  j = 0

  has_diff = false
  while i < str1.length
    if str1[i] != str2[j]
      if has_diff
        return false
      else
        has_diff = true
        if str1.length > str2.length
          i = i + 1
        elsif str1.length < str2.length
          j = j + 1
        else
          i = i + 1
          j = j + 1
        end
      end
    else
      i = i + 1
      j = j + 1
    end
  end

  true
end

puts is_one_away('pale', 'ple')
puts is_one_away('pales', 'pale')
puts is_one_away('pale', 'bale')
puts is_one_away('pale', 'bake')
