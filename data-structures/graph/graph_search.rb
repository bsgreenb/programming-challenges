require_relative 'graph'

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

def depth_first_search(root, search_val = nil)

end

# The key to this algorithm is the use of a queue, rather than recursive call stack
def breadth_first_search(root, search_val = nil)

end

# Bidirectional searches
def bidirectional_search(root, search_val = nil)

end
