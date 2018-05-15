require_relative 'graph'

# Dijkstra's algorithm adapts BFS to let you find single-source shortest paths.
# Requirement that the edges have positive values.

def djikstra(graph, start_node, end_node)
  path_weights = {}
  previous_shortest_path = {}
  remaining = graph.nodes

  # Begin by setting weight of start node to 0, others to infinity
  graph.nodes.each do |node|
    if node == start_node
      path_weights[node] = 0
    else
      path_weights[node] = Float::INFINITY
    end
  end

  #TODO: can stop when we reach destination

  # pluck the node in remaining with lowest path weight.  this will always be the start node to begin
  while remaining.length > 0
    min_index = nil
    lowest_score = Float::INFINITY
    remaining.each_with_index do |remaining_node, i|
      if path_weights[remaining_node] < lowest_score
        min_index = i
        lowest_score = path_weights[remaining_node]
      end
    end
    node = remaining.delete_at(min_index)

    # Update path_weight/previous of neighboring nodes based on shortest path
    # Also notice how we consider there may be no connections for the min_node.
    (node.connections || []).each do |neighbor, weight|
      if path_weights[neighbor] > (path_weights[node] + weight)
        path_weights[neighbor] = path_weights[node] + weight
        previous_shortest_path[neighbor] = node
      end
    end
  end

  node = end_node
  shortest_path = []

  while node
    shortest_path.unshift(node)
    node = previous_shortest_path[node]
  end

  puts path_weights[end_node]
  shortest_path.map{|node| node.value}
end

graph = Graph.new
node_a = Node.new('A')
node_b = Node.new('B')
node_c = Node.new('C')
node_d = Node.new('D')
node_e = Node.new('E')
node_f = Node.new('F')
node_g = Node.new('G')
node_h = Node.new('H')
node_i = Node.new('I')
node_a.connections = [
  [node_b, 5],
  [node_c, 3],
  [node_e, 2]
]
node_b.connections = [
  [node_d, 2]
]
node_c.connections = [
  [node_b, 1],
  [node_d, 1]
]
node_d.connections = [
  [node_a, 1],
  [node_g, 2],
  [node_h, 1]
]
node_e.connections = [
  [node_a, 1],
  [node_h, 4],
  [node_i, 7]
]
node_f.connections = [
  [node_b, 3],
  [node_g, 1]
]
node_g.connections = [
  [node_c, 3],
  [node_i, 2]
]
node_h.connections = [
  [node_c, 2],
  [node_f, 2],
  [node_g, 2]
]
graph.nodes = [node_a, node_b, node_c, node_d, node_e, node_f, node_g, node_h, node_i]

puts djikstra(graph, node_a, node_i)

#CONTINYA on this one
def bidirectional_djikstra

end
