require_relative 'tree'

class BinaryTreeNode
  attr_accessor :value, :left_node, :right_node

  def initialize(val)
    @value = val
    @left_node = nil
    @right_node = nil
  end
end

class BinaryTree
  attr_accessor :root

  def add_value(val)
    node = @root
    if !@root
      @root = BinaryTreeNode.new(val)
      return
    end


    #TODO: would be cleaner with recursion
    loop do
      # Note that we went with <= on left
      if (val <= node.value)
        if node.left_node
          node = node.left_node
          break
        else
          node.left_node = BinaryTreeNode.new(val)
        end
      else # Right side
        if node.right_node
          node = node.right_node
        else
          node.right_node = BinaryTreeNode.new(val)
          break
        end
      end
    end
  end


  # Get back to this and put on recursion thinking cap.  Let's visit recursion chapter maybe.  Basically need to know pattern for not having to build up in a sperate param.
  # Recursion makes this nice
  def in_order_traversal(node)
    return nil unless node
    nodes = []
    nodes.push()
    return [in_order_traversal(node.left_node)] + [node.value] + [in_order_traversal(node.right_node)]
  end
end

binary_tree = BinaryTree.new
binary_tree.add_value(123)
binary_tree.add_value(43)
puts binary_tree.inspect
puts binary_tree.in_order_traversal(binary_tree.root).inspect


# In Order Traversal (From least to most)


# Pre-Order Traversal (Current node before children)

# Post-Order Travels (Children before current node)
