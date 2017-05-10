require 'byebug'
str = 'abcd'

def permutations(str)
  return str if str.length == 1
  str = str.split('') if str.is_a? String

  perms = []
  rest_of_str = str[1, str.length]
  permutations(rest_of_str).each do |lower_permutation|
    (0..str.length - 1).each do |i|
      perms.push(lower_permutation.dup.insert(i, str[0]))
    end
  end

  return perms
end

puts permutations(str).inspect
