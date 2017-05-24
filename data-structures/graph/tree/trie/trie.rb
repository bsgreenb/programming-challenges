class Node
  attr_accessor :word_end, :value, :children

  def initialize(val = nil, word_end = false)
    @value = val
    @word_end = word_end
    @children = []
  end

end

class Trie
  attr_accessor :root

  def initialize
    @root = Node.new
  end

  def add_word(word)

  end

  def has_word?(word)
    return true
  end

end
