# Implement a method to perform basic string compression using the counts of repeated characters.  For example,
# the string aabcccccaaa would become a2b1c5a3.  If the "Compressed" string would not become smaller than# the original string,
# your method should return the original string.  You can assume the string has only uppercase and lowercase letters a-z.

# Notice first off that it respects the order theyre in, so you can see a repeating.

def string_compression(str)
  new_str = ''
  current_letter = nil
  current_letter_count = 0

  str.split('').each do |char|
    if char != current_letter
      if !current_letter.nil?
        new_str += current_letter + current_letter_count.to_s
      end
      current_letter = char
      current_letter_count = 1
    else
      current_letter_count += 1
    end
  end

  new_str += current_letter + current_letter_count.to_s

  new_str
end

puts string_compression('aabcccccaaa')
