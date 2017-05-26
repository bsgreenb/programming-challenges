class Node
  attr_accessor :term, :char, :children

  def initialize(char = nil, term: false)
    raise 'Single character only' if char && char.length != 1
    @char = char
    @term = term
    @children = []
  end

  def get(str)
    if str == '' # Base case
      return @children.find(&:term)
    else
      next_node = @children.find{ |child| child.char == str[0] }
      next_node ? next_node.get(str[1..-1]) : nil
    end
  end

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
