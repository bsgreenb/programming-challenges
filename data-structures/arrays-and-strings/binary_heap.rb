require 'byebug'
# Array implementation has better time complexity but potentially worse space
# complexity than the linked nodes implementation.  The array implementation
# is also special and useful to know about.  So we'll implement Binary Heap
# in that way here.

# We will implement a max heap where values at top are always bigger than ones below.

class Node
  attr_accessor :value

  def initialize(value)
    @value = value
  end
end


class BinaryHeap
  attr_accessor :heap_arr

  def initialize
    @heap_arr = []
  end

  def left_child(index)
    @heap_arr[2*index]
  end

  def right_child(index)
    @heap_arr[2*index + 1]
  end

  def parent_index(index)
    return nil if index.zero?
    return 0 if index == 2
    index/2
  end

  def leaf_index?(index)
    index >= @heap_arr.length / 2
  end

  # Replace the [0]th element with the last one and bubble it down
  def peek_max
    @heap_arr[0]
  end

  # Push the element and bubble up.  This adds memory and then puts it in the right place.
  def push(element)
    offset = @heap_arr.length
    node = Node.new(element)
    @heap_arr << node

    bubble_up(node)
  end

  # Recursively push an element up from the bottom of the tree as needed
  def bubble_up(element)
    offset = @heap_arr.length - 1

    loop do
      #CONTINYA here: parent_index is giving nil which is mee
      # binary_heap.rb:65:in `[]': no implicit conversion from nil to integer (TypeError)
      parent_index = parent_index(offset)
      parent_node = @heap_arr[parent_index]

      break unless offset > 0 && parent_node.value < element.value

      offset = parent_index

      # Swap
      parent_node, @heap_arr[offset] = @heap_arr[offset], parent_node

    end
  end

  # Pop the element and bubble down.  We need to do this so that everything aintains its place in memory.
  def pop_max
    max_value = @heap_arr[0]

    if @heap_arr.size > 0
      @heap_arr[0] = @heap_arr.pop
      bubble_down(@heap_arr[0])
    end

    return value
  end

  # Recursively push an element down the tree as needed
  def bubble_down(node)
    offset = 0
    while (offset < @heap_arr.size / 2)
      left_ch = left_child(offset)
      right_ch = right_child(offset)

      if (left_ch.value > right_ch.value)
        larger_child = left_ch
      else
        larger_child = right_ch
      end

      if node.value >= larger_child.value
        break
      end

      # Switch em
      @heap_arr[offset], larger_child = larger_child, @heap_arr[offset]
    end
  end
end

# Testing it..
bh = BinaryHeap.new
bh.push(1)
bh.push(5)
bh.push(3)

puts bh.heap_arr.inspect
