TERM_CHAR = '*'
class Node
  attr_accessor :char, :children

  def initialize(char = nil)
    raise 'Single character only' if char && char.length != 1
    raise 'Only Term Char (*) and letters allowed' unless char.nil? || /[a-zA-Z\*]/.match(char)
    @char = char
    @children = []
  end

  # Recursively grabs nodes by char from provided string.
  def get(str)
    puts "getting " + str
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
    puts "setting " + str
    char = str[0] || TERM_CHAR
    next_node = find_child(char)

    unless next_node
      next_node = Node.new(char)
      @children << next_node
    end

    if str == ''
      return
    else
      next_node.set(str[1..-1])
    end
  end
end

class Trie
  attr_accessor :root

  def initialize
    @root = Node.new
  end

  def add_word(word)
    @root.set(word)
  end

  def has_word?(word)
    term_node = @root.get(word)
    !!(term_node && term_node.char == TERM_CHAR)
  end

end
