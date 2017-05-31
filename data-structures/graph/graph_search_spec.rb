
require_relative 'graph_search'



#TODO: map out deez cases

describe 'graph search' do
  before do
    @node_0 = Node.new(0)
    @node_1 = Node.new(1)
    @node_2 = Node.new(2)
    @node_3 = Node.new(3)
    @node_4 = Node.new(4)
    @node_5 = Node.new(5)
    allow(@node_0).to receive(:visit).and_call_original
    allow(@node_1).to receive(:visit).and_call_original
    allow(@node_2).to receive(:visit).and_call_original
    allow(@node_3).to receive(:visit).and_call_original
    allow(@node_4).to receive(:visit).and_call_original
    allow(@node_5).to receive(:visit).and_call_original

    @node_0.connections = [@node_1, @node_4, @node_5]
    @node_1.connections = [@node_3, @node_4 ]
    @node_2.connections = [@node_1]
    @node_3.connections = [@node_2, @node_4]
    # No connections for 4 and 5

    @graph = Graph.new
    @graph.nodes = [@node_0, @node_1, @node_2, @node_3, @node_4, @node_5]
  end

  describe 'depth_first_search' do
    it 'visits the nodes in expected order' do

      depth_first_search(@graph.nodes[0])

      expect(@node_0).to have_received(:visit).ordered
      expect(@node_1).to have_received(:visit).ordered
      expect(@node_3).to have_received(:visit).ordered
      expect(@node_2).to have_received(:visit).ordered
      expect(@node_4).to have_received(:visit).ordered
      expect(@node_5).to have_received(:visit).ordered
    end
  end


  describe 'breadth_first_search' do
    context 'visiting all nodes' do
      it 'visits the nodes in expected order' do
        breadth_first_search(@graph.nodes[0])

        expect(@node_0).to have_received(:visit).ordered
        expect(@node_1).to have_received(:visit).ordered
        expect(@node_4).to have_received(:visit).ordered
        expect(@node_5).to have_received(:visit).ordered
        expect(@node_3).to have_received(:visit).ordered
        expect(@node_2).to have_received(:visit).ordered
      end
    end

    context 'searching for 3' do
      it 'visits the nodes in expected order' do
        expect(breadth_first_search(@graph.nodes[0], 3)).to eq(@graph.nodes[3])

        expect(@node_0).to have_received(:visit).ordered
        expect(@node_1).to have_received(:visit).ordered
        expect(@node_4).to have_received(:visit).ordered
        expect(@node_5).to have_received(:visit).ordered
        expect(@node_3).to have_received(:visit).ordered
        expect(@node_2).not_to have_received(:visit)
      end
    end
  end
end
