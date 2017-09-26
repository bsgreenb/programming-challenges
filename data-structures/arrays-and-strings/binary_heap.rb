require 'byebug'
# Array implementation has better time complexity but potentially worse space
# complexity than the linked nodes implementation.  The array implementation
# is also special and useful to know about.  So we'll implement Binary Heap
# in that way here.

# We will implement a Max Heap where values at top are always bigger than ones below.

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

  def peek_max
    @heap_arr[0]
  end
  #TODO: lets build this from scratch with Insert and extract_max_element methods.  I think what was missing prior was setting it to the bottomest/rightest index.

  # Push the element and bubble up.  This adds memory and then puts it in the right place.
  def insert(element)
    offset = @heap_arr.length

    node = Node.new(element)
    @heap_arr << node

    bubble_up(node)
  end

  # Recursively push an element up from the bottom of the tree as needed
  def bubble_up(element)
    # 'We "fix" the tree by swappning the new element with its parent, until we
    # find an appropriate spot for the element'

    offset = @heap_arr.length - 1
    loop do
      parent_index = parent_index(offset)
      break if parent_index.nil?

      parent_node = @heap_arr[parent_index]

      break unless parent_node.value < element.value

      # https://coderwall.com/p/be_1va/swap-two-elements-of-an-array-in-ruby
      @heap_arr[parent_index], @heap_arr[offset] = @heap_arr[offset], @heap_arr[parent_index]
      offset = parent_index
    end
  end

  # Pop the element and bubble down.  We need to do this so that everything maintains its place in memory.
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

#TODO: get this sucka running..
# Testing it..
bh = BinaryHeap.new
bh.insert(1)
bh.insert(3)
bh.insert(5)
bh.insert(17)
bh.insert(4)
puts bh.heap_arr.inspect
#TODO: check the extract_max behavior.
