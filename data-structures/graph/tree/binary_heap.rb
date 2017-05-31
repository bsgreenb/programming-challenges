require_relative 'tree'

class Node
  attr_accessor :value, :left_node, :right_node

  def initialize(val)
    @value = val
    @left_node = nil
    @right_node = nil
  end

  def add_value(val)
    if val <= @value
      next_node = @left_node
    else
      next_node = @right_node
    end

    if next_node
      next_node.add_value(val)
    else
      new_node = Node.new(val)
      if val <= @value
        @left_node = new_node
      else
        @right_node = new_node
      end
    end
  end

end

class BinaryHeap
  attr_accessor :root

  def initialize(val)
    @root = Node.new(val)
  end

  def add_value(val)
    @root.add_value(val)
  end

  # In Order Traversal (From least to most)
  def in_order_traversal(node)
    return [] unless node
    in_order_traversal(node.left_node) + [ node.value ] + in_order_traversal(node.right_node)
  end

  # Pre-Order Traversal (Current node before children)
  def pre_order_traversal(node)
    return [] unless node
    [ node.value ] + pre_order_traversal(node.left_node) + pre_order_traversal(node.right_node)
  end

  # Post-Order Traversal (Children before current node)
  def post_order_traversal(node)
    return [] unless node
    pre_order_traversal(node.left_node) + pre_order_traversal(node.right_node) + [ node.value ]
  end

end

tree = BinaryTree.new(13)
tree.add_value(4)
tree.add_value(50)
tree.add_value(5)

puts tree.inspect
puts tree.in_order_traversal(tree.root).inspect
puts tree.pre_order_traversal(tree.root).inspect
puts tree.post_order_traversal(tree.root).inspect
