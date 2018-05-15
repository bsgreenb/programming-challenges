require 'pqueue'
# Efficiency: By usinge a priority queue structure (e.g. binary heap) and adjacency list, we can get it down to O(E log V)
# Note: if you want to avoid cycles, you'll want to keep track of what you already visited.  But it can't deal at all with negative cycles
def dijikstra(source, edges, num_vertices)
  path_weights = Array.new(num_vertices, Float::INFINITY)
  previous_shortest_path = Array.new(num_vertices, nil)
  pq = PQueue.new([source]){|x,y| path_weights[x] < path_weights[y]}
  path_weights[source] = 0

  until pq.size.zero?
    min_node = pq.pop
    # Note: If we are interested only in shortest distance from source to a single target, we can break the for loop when the picked minimum distance vertex is equal to target

    (edges[min_node] || []).each do |neighbor, weight|
      if path_weights[neighbor] > path_weights[min_node] + weight
        path_weights[neighbor] = path_weights[min_node] + weight
        previous_shortest_path[neighbor] = min_node
        pq.push(neighbor)
      end
    end
  end

  return [path_weights, previous_shortest_path]
end

edges = {}
edges[0] = {}
edges[0][1] = 5
edges[0][2] = 3
edges[0][4] = 2

edges[1] = {}
edges[1][3] = 2

edges[2] = {}
edges[2][1] = 1
edges[2][3] = 1

edges[3] = {}
edges[3][0] = 1
edges[3][6] = 2
edges[3][7] = 1

edges[4] = {}
edges[4][0] = 1
edges[4][7] = 4
edges[4][8] = 7

edges[5] = {}
edges[5][1] = 3
edges[5][6] = 1

edges[6] = {}
edges[6][2] = 3
edges[6][8] = 2

edges[7] = {}
edges[7][2] = 2
edges[7][5] = 2
edges[7][6] = 2

puts dijikstra(0, edges, 9).inspect
