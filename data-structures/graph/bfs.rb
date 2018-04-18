def get_shortest_paths(num_nodes, start_node, edges)
    #TODO: Addresss possible 1-based numbering they use
    path_weights = {}
    (1..num_nodes).each do |n|
        if n == start_node
            path_weights[n] = 0
        else
            path_weights[n] = Float::INFINITY
        end
    end

    remaining = {}
    (1..num_nodes).to_a.each do |n|
        remaining[n] = true
    end

    while (remaining.length > 0)
        min_index = nil
        lowest_score = Float::INFINITY
        #pluck the lowest
        remaining.each do |remaining_node, val|
            if path_weights[remaining_node] < lowest_score
                min_index = remaining_node
                lowest_score = path_weights[remaining_node]
            end
        end
        break unless min_index
        remaining.delete(min_index)

        (edges[min_index] || []).each do |neighbor|
            if path_weights[neighbor] > path_weights[min_index] + 6
                path_weights[neighbor] = path_weights[min_index] + 6
            end
        end
    end

    # TODO: output shortest path with the start_node deleted
    shortest_paths = []
    path_weights.each do |node, val|
        next if node == start_node
        if val == Float::INFINITY
            shortest_paths[node] = -1
        else
            shortest_paths[node] = val
        end
    end

    return shortest_paths.compact
end

num_queries = gets.to_i

num_queries.times do
    num_nodes, num_edges = gets.split(' ').map(&:to_i)
    edges = {}
    num_edges.times do
        node_1, node_2 = gets.split(' ').map(&:to_i)
        edges[node_1] ||= []
        edges[node_1].push(node_2)
        edges[node_2] ||= []
        edges[node_2].push(node_1)
    end

    start_node = gets.to_i
    # puts "Num Nodes: " + num_nodes.to_s
    # puts "Edges: " + edges.inspect
    # puts "Start Node: " + start_node.to_s

    shortest_paths = get_shortest_paths(num_nodes, start_node, edges)

    puts shortest_paths.join(' ')
end
