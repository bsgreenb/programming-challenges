require_relative 'graph'
require 'byebug'

# Two different types of Graph Search: Depth-First and Breadth First.

# Depth first : start at the root, and go down each branch completely before moving on to next branch.
# Breadth first: Start at the root, and explore each neighbor before going deep on any branches.

# Breadth first helps you find shortest paths better becacuse it wont venture
# far out to find stuff.

# Nte that pre-order and other forms of tree traversal are a form of DFS.  The key difference is that when
# implementing this for a cyclic (not tree) graph, is that you have to keep track of what you already visited to
# prevent infinite loops.

# A lot of tech interviews hinge on understanding of these graphs searches.

#CONTINYA: finishing trie spec
#CONTINYA: understnading the BFS and DFS and bidirectional pseudocode, and implementing with spec

def depth_first_search(node)
  return if node.nil?
  node.visit
  node.connections.each do |conn|
    depth_first_search(conn) unless conn.visited
  end
end

# The key to this algorithm is the use of a queue, rather than recursive call stack
# Since breadth fist search is often used to find values
# Technically, Breadth-first search (BFS) by itself does not let you find the shortest path,
# simply because BFS is not looking for a shortest path: BFS describes a strategy for searching a graph,
# but it does not say that you must search for anything in particular.

# Dijkstra's algorithm adapts BFS to let you find single-source shortest paths.
# In order to retrieve the shortest path from the origin to a node, you need to
# maintain two items for each node in the graph: its current shortest distance,
# and the preceding node in the shortest path.

# THINK: about how youd establish a path..
def breadth_first_search(node, search_val = nil)
  return unless node
  visit_queue = [node]

  while (!visit_queue.empty?)
    node = visit_queue.shift
    node.visit
    return node if node.value == search_val
    node.connections.each do |conn|
      next if conn.marked
      conn.marked = true
      visit_queue.push(conn)
    end
  end
end
