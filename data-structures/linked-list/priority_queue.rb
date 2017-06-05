require_relative 'linked_list'

# a priority queue is an abstract data type which is like a regular queue or
# stack data structure, but where additionally each element has a "priority"
# associated with it. In a priority queue, an element with high priority is
# served before an element with low priority

# One can imagine a priority queue as a modified queue, but when one would get
# the next element off the queue, the highest-priority element is retrieved
# first.

#hmm.
#To improve performance, priority queues typically use a heap as their backbone, giving O(log n) performance for inserts and removals, and O(n log n) to build initially. Variants of the basic heap data structure such as pairing heaps or Fibonacci heaps can provide better bounds for some operations

# proly wanna use heapsort..
#CONTINYA with this ish...  maybe I go for the heapsort?
class PriorityQueue
  def initialize
    #TODO: data structure it
  end

  # add an element to the queue with an associated priority.
  def insert_with_priority(val, priority)
  end

  # remove the element from the queue that has the highest priority, and return
  # it.
  def pull_highest_priority_element

  end

  # peek (in this context often called find-max or find-min), which returns the
  # highest-priority element but does not modify the queue, is very frequently
  # implemented, and nearly always executes in O(1) time. This operation and its
  # O(1) performance is crucial to many applications of priority queues.
  def peek

  end

end
