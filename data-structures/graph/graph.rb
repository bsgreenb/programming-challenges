# There are two common ways to represent a graph.
# The most common is adjacency list.  The other option is adjacency matrix.
# Adjacency list approach is preferable to matrix in most cases, because it
# takes less time to loop through a node's connections.
# So let's implement with Adjacency List

class Node
  attr_accessor :value
  attr_accessor :visited
  attr_accessor :connections

  def initilize(val)
    @value = val
    @connections = []
    @visited = false
  end

  def visit
    raise 'Already visited' if @visited
    puts 'Visiting ' + self
    @visited = true
  end

  def to_s
    @value.to_s
  end
end

class Graph
  attr_accessor :nodes
  def initialize
    @nodes = []
  end
end
