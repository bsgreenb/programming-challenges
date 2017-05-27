class Node
  attr_accessor :char, :children

  TERM_CHAR = '*'

  def initialize(char = nil)
    raise 'Single character only' if char && char.length != 1
    raise 'Only Term Char (*) and letters allowed' unless char.nil? || /[a-zA-Z\*]/.match(char)
    @char = char
    @children = []
  end

  # Recursively grabs nodes by char from provided string.
  def get(str)
    char = str[0] || TERM_CHAR
    next_node = find_child(char)
    return nil if next_node.nil?
    if str == ''
      next_node
    else
      next_node.get(str[1..-1])
    end
  end

  def find_child(char)
    @children.find{ |child| child.char == char }
  end

  # Recursively sets nodes by char from provided string.
  def set(str)
    if str == ''
      if @children.find(&:term)
        return
      else
        @children << Node.new(term: true)
      end
    else
      next_node = @children.find{ |child| child.char == str[0] }
      unless next_node
        next_node = @children << Node.new(str[0])
      end

      next_node.set(str[1..-1])
    end
  end
end

class Trie
  attr_accessor :root

  def initialize
    @root = Node.new
  end

  def has_word?(word)
    true
  end

end
