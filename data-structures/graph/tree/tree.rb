class TreeNode
  attr_accessor :value, :children

  def initialize(val)
    @value = val
    @children = []
  end

  def add_child(val)
    @children << TreeNode.new(val)
  end
end

class Tree
  attr_accessor :root

  def initialize(val)
    @root = TreeNode.new(val)
  end
end
