require 'byebug'

hash = {}
key_arr = [:a, :b, :c]

def hash_setter(hash, key_arr, val)
  key = key_arr.shift
  hash[key] = {} unless hash[key].is_a?(Hash)
  key_arr.length > 0 ? hash_setter(hash[key], key_arr, val) : hash[key] = val
end

hash_setter(hash, key_arr, 'c')
puts hash

def hash_setter_with_iteration(hash, key_arr, val)
  hash_dup = hash.dup
  key_arr.each_with_index do |key, i|
    unless i == key_arr.length - 1
      hash_dup[key] ||= {}
    else
      hash_dup[key] = val
    end
  end
  hash.merge(hash_dup)
end
