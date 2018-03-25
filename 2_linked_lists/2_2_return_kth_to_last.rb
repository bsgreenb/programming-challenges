
# Implement an algorithm to find the kth to last element of a singly linked list.

# So my thinking is to have two pointers, and walk one of them k steps ahead first.  Return the later pointer when the early one reaches the end
require_relative 'linked_list'

ll = LinkedList.new('a')
ll.add('b')
ll.add('c')
ll.add('h')
ll.add('r')

def kth_to_last(ll, k)
  steps_to_wait = k
  runner = ll.head
  pointer = ll.head

  while (runner)
    if steps_to_wait > 0
      steps_to_wait -= 1
    else
      pointer = pointer.next
    end
    runner = runner.next
  end

  return pointer.val
end

# Should return h
puts kth_to_last(ll, 2)
