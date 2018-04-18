#TODO: write dat out..
# Implementing this using an AVL tree
# https://en.wikipedia.org/wiki/AVL_tree
# https://en.wikipedia.org/wiki/Tree_rotation
# QSTN: handling duplicates?

class Node
  attr_accessor :value, :left, :right, :height

  def getHeight(node)
    if node.nil?
      return -1
    else
      return node.height
    end
  end

  def setHeight(node)
    if node.nil?
      return -1
    else
      return 1 + [getHeight(node.left), getHeight(node.right)].max
    end
  end

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
    @height = nil
  end

  def rightRotation(root)
    newRoot = root.left
    root.left = newRoot.right
    newRoot.right = root
    root.height = setHeight(root)
    newRoot.height = setHeight(newRoot)
    return newRoot
  end

  def leftRotation(root)
    newRoot = root.right
    root.right = newRoot.left
    newRoot.left = root
    root.height = setHeight(root)
    newRoot.height = setHeight(newRoot)
    return newRoot
  end

  def insert(root, val)
    if root.nil?
      root = Node.new(val)
      root.height = setHeight(root)
      return root
    end

    if (val <= root.value)
      root.left = insert(root.left, val)
    elsif (val > root.value)
      root.right = insert(root.right, val)
    end

    balance = getHeight(root.left) - getHeight(root.right)

    if balance > 1
      if getHeight(root.left.left) >= getHeight(root.left.right)
        root = rightRotation(root)
      else
        root.left = leftRotation(root.left)
        root = rightRotation(root)
      end
    elsif balance < -1
      if getHeight(root.right.right) >= getHeight(root.right.left)
        root = leftRotation(root)
      else
        root.right = rightRotation(root.right)
        root = leftRotation(root)
      end
    else
      root.height = setHeight(root)
    end

    return root
  end
end

avlTree = Node.new(1)
avlTree = avlTree.insert(avlTree, 2)
avlTree = avlTree.insert(avlTree, 3)
puts avlTree.inspect
