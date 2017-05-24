# Can be implemented using a linked list where key -> unique ID
# https://launchschool.com/blog/how-the-hash-works-in-ruby and CTCI as guides
require_relative 'linked_list'

# The hash data structure derives it’s name from this hashing mechanism. Ruby
# uses the murmur hash function and then applies the division method with a prime number M, which Ruby determines based on the table size that is needed for storage.
# murmur_hash(key) % M

# In case two keys return the same number, also known as a hash collision, the value is chained on to the same location or bucket in the table.
# One interesting thing to note is hashes are unique for each Ruby process. The murmur hash seeds it with a random value, which results in a different hash for a particular key for each Ruby process.

# Starting with Ruby 1.9.3, a property of the hash is that the keys are ordered based on how they are inserted into the hash.  This is nice for example in keyword argumemnts.

class HashTable
  def initialize
    @keys = []
  end

  def []=(key, val)
    hash = key.hash % 31
    @keys[hash] ||= []
    @keys[hash].each do |ll|
      if ll.head.val == key
        # Collision case
        ll.head.next.val = val
        return
      end
    end

    # No hash collisions
    ll = LinkedList.new(key)
    ll.add(val)

    @keys[hash] << ll
  end

  def [](key)
    # Note: you want an algorithm for the hash modulus that scales well with @keys.size.  Could be accomplished with 2^n or prime growth.
    hash = key.hash % 31
    return nil unless @keys[hash]
    @keys[hash].each do |ll|
      return ll.head.next.val if ll.head.val == key
    end
    return nil
  end
end

hash = HashTable.new
hash['a'] = 'b'
hash['a'] = 'h'
hash['b'] = 'c'

hash_inside_hash = HashTable.new
hash_inside_hash['x'] = 'z'

hash['c'] = hash_inside_hash
puts hash['a'].inspect
puts hash['b'].inspect
puts hash['c']['x'].inspect
hash['c']['x'] = 'Q'
puts hash['c']['x'].inspect
