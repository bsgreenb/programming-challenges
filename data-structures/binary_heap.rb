require 'byebug'
# Array implementation has better time complexity but potentially worse space
# complexity than the linked nodes implementation.  The array implementation
# is also special and useful to know about.  So we'll implement Binary Heap
# in that way here.

# We will implement a Max Heap where values at top are always bigger than ones below.

# Note, using 1-based array.

class Node
  attr_accessor :value

  def initialize(value)
    @value = value
  end
end

class BinaryHeap
  attr_accessor :heap_arr, :max_heap

  def initialize(is_max_heap)
    @heap_arr = [nil]
    @max_heap = is_max_heap
  end

  def left_child(index)
    @heap_arr[2*index]
  end

  def left_child_index(index)
    2*index
  end

  def right_child(index)
    @heap_arr[2*index + 1]
  end

  def right_child_index(index)
    2*index + 1
  end

  def parent_index(index)
    return nil if index == 1
    return index/2
  end

  def leaf_index?(index)
    index < @heap_arr.length && index > (@heap_arr.length - 1) / 2
  end

  def peek_max
    @heap_arr[1]
  end

  def peek_min
    peek_max
  end

  # Push the element and bubble up.  This adds memory and then puts it in the right place.
  def insert(element)
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

      if @max_heap
        break if parent_node.value >= element.value
      else
        break if parent_node.value <= element.value
      end

      # https://coderwall.com/p/be_1va/swap-two-elements-of-an-array-in-ruby
      @heap_arr[parent_index], @heap_arr[offset] = @heap_arr[offset], @heap_arr[parent_index]
      offset = parent_index
    end
  end

  # Pop the element and bubble down.  We need to do this so that everything maintains its place in memory.
  def pop_max
    #When doing the swaps, we swap with the larger element to maintain max-heap ordering.
    max_value = @heap_arr[1]

    if @heap_arr.size > 2
      @heap_arr[1] = @heap_arr.pop
      bubble_down(@heap_arr[1])
    elsif @heap_arr.size > 1
      @heap_arr.pop
    end

    return max_value
  end

  def pop_min
    pop_max
  end

  # Recursively push an element down the tree as needed
  def bubble_down(node)
    offset = 1

    while offset <= ((@heap_arr.size - 1) / 2)
      left_ch = left_child(offset)
      right_ch = right_child(offset)

      if (@max_heap)
        if (!right_ch || left_ch.value > right_ch.value)
          larger_child = left_ch
          new_offset = left_child_index(offset)
        else
          larger_child = right_ch
          new_offset = right_child_index(offset)
        end

        if node.value >= larger_child.value
          break
        end
      else
        if (!right_ch || left_ch.value < right_ch.value)
          smaller_child = left_ch
          new_offset = left_child_index(offset)
        else
          smaller_child = right_ch
          new_offset = right_child_index(offset)
        end

        if node.value <= smaller_child.value
          break
        end
      end

      # Switch em
      @heap_arr[offset], @heap_arr[new_offset] = @heap_arr[new_offset], @heap_arr[offset]
      offset = new_offset
    end
  end
end

#TODO: get this sucka running..
# Testing it..
bh = BinaryHeap.new(false)
bh.insert(1)
bh.insert(3)
bh.insert(5)
bh.insert(17)
bh.insert(4)
puts bh.heap_arr.inspect
puts bh.pop_max
puts bh.heap_arr.inspect
puts bh.pop_max
puts bh.heap_arr.inspect
puts bh.pop_max
puts bh.heap_arr.inspect
puts bh.pop_max
puts bh.heap_arr.inspect
puts bh.pop_max
puts bh.heap_arr.inspect
puts bh.pop_max.inspect
puts bh.heap_arr.inspect
puts bh.pop_max.inspect
bh.insert(1)
bh.insert(3)
bh.insert(5)
puts bh.heap_arr.inspect
bh.insert(4)
bh.insert(17)
bh.insert(6)
puts bh.heap_arr.inspect


#TODO: test with size 1/2 inserts and pops
