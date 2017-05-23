# Goal here is to understand Linked Lists, and implement one from scratch in Ruby
# Adapted from http://wlowry88.github.io/blog/2014/08/20/linked-lists-in-ruby/

# A linked list is a data structure that consists of a collection of nodes that
# represent a sequence. Each element in a linked list will contain a datum and a
# reference to the next element in the linked list (a pointer).

# (Sometimes linked lists have reference to the previous eleent as well)

# Linked lists’ biggest advantage over arrays in other languages is their
# ability to insert / remove list elements without reallocating or reorganization
# of the entire data structure. Arrays have indices, so deleting a value at index
# 0 for example requires every single item to be reindexed.

# The flip-side of this, however, is that performing operations requiring access
# to particular elements of a linked list can be cumbersome. For example, finding
# the last element of a linked list requires scanning every element of the list.

# It’s easy to building linear data structures such as stacks and queues with
# linked lists.

# Cons:
# - Since each element holds a value and a pointer, it’s more memory intensive.
# - You have to access nodes sequentially since that’s how they’re defined;
# furthermore they’re not stored continuously so it takes longer to access an element.
# - With a singly-linked list it’s pretty much terrible to reverse traverse.
# Doubly-linked lists contain a pointer to the previous node as well but that’s
#even more memory intensive.

class Node
  attr_accessor :val, :next

  def initialize(val, next_node)
    @val = val
    @next = next_node
  end

  def inspect
    @val
  end

end

class LinkedList
  attr_accessor :head

  def initialize(val)
    @head = Node.new(val, nil)
  end

  def add(val)
    current = @head
    while current.next
      current = current.next
    end
    current.next = Node.new(val, nil)
  end

  def delete(val)
    current = @head
    if @head.val == val
      @head = @head.next
    else
      # Loop until
      while (current.next && current.next.val != val)
        current = current.next
      end
      if current.next
        current.next = current.next.next
      end
    end
  end

  def to_a
    arr = []
    current = @head
    while true
      arr << current
      break unless current.next
      current = current.next
    end
    return arr
  end
end

# ll = LinkedList.new('a')
# ll.add('b')
# ll.add('c')
# ll.delete('b')
# puts ll.to_a.inspect
