
require_relative 'graph_search'

before do

  node_0 = Node.new(1)
  node_1 = Node.new(2)
  node_2 = Node.new(3)
  node_3 = Node.new(4)
  node_4 = Node.new(5)
  node_5 = Node.new(6)

  node_0.connections = [node_1, node_4, node_5]
  node_1.connections = [node_4, node_3]
  node_2.connections = [node_1]
  node_3.connections = [node_2, node_4]
  # No connections for 4 and 5

  @graph = Graph.new
  @graph.nodes = [node_1, node_2, node_3, node_4, node_5, node_6]
end

#TODO: map out deez cases

describe 'depth_first_search' do
  subject do
    depth_first_search(@graph)
  end

  it 'visits the current node' do
    allow(@graph.root).to

    subject
  end

  context 'has unvisited connection' do
    it 'visits the connection' do

    end
  end

  context 'children have already been visited' do
    it 'does not visit additional connections' do

    end
  end


end
