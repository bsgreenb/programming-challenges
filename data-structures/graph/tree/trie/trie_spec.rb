require_relative 'trie'

RSpec.describe Node do
  describe 'initialize' do
    it 'initializes char as nil' do
      expect(Node.new.char).to eq(nil)
    end

    it 'initializes children as empty array' do
      expect(Node.new.children).to eq([])
    end

    it 'allows the term char (*) to be used' do
      Node.new('*')
    end

    it 'disallows non alpha or term characters' do
      expect { Node.new('_') }.to raise_error
    end

    it 'disallows multiple length chars' do
      expect { Node.new('aa') }.to raise_error
    end
  end

  describe 'get' do
    context 'next character is not there (base case)' do
      it 'returns null' do
        node = Node.new
        expect(node.get('A')).to eq(nil)
      end
    end

    context 'next character is there' do

      it 'returns get with the rest of the string' do
        node = Node.new
        child = Node.new('A')
        allow(child).to receive(:get).with('ll')
        node.children = [ child ]

        node.get('All')

        expect(child).to have_received(:get).with('ll')
      end
    end

    context 'at end of string, terminator is not there' do
      it 'returns null' do
        node = Node.new
        node.children = [Node.new('J')]

        expect(node.get('')).to eq(nil)
      end
    end

    context 'terminator is there' do
      it 'returns the terminator node' do
        node = Node.new
        child = Node.new('*')
        node.children = [child]

        expect(node.get('')).to eq(child)
      end
    end
  end

  #CONTINYA at set
  describe 'set' do
    # This one will be recursive as well.

    context 'at end of string, node is already there' do
      it 'does not alter the node' do
          node = Node.new
          term_node = Node.new('*')
          node.children = [term_node]

          node.set('')

          expect(node.children == [term_node])
      end
    end

    context 'at end of string, node is not there already' do
      it 'adds the term_node' do
        node = Node.new.set('')

        expect(node.children).to eq([Node.new('*')])
      end
    end

    context 'string there already' do
      before do
        @node = Node.new
        child = Node.new('A')
        child.children = [Node.new('*')]
        @node.children = [child]

      end

      it 'does not modify its children' do
        original_node = node.dup
        @node.set('A')

        expect(@node).to eq(original_node)
      end
    end

    context 'next node is not already there' do
      it 'adds the new node to children' do
        node = Node.new.set('A')
        expect(node.children[0].char).to eq('A')
        expect(node.children[0].children[0]).to eq('*')
      end
    end
  end
end

#TODO: make sure we implement 4 part test pattern
RSpec.describe Trie do
  describe 'initialize' do
    trie = Trie.new
    it 'initializes null root node' do
      expect(trie.root.char).to eq(nil)
    end

    it 'initializes root node with no children' do
      expect(trie.root.children).to eq([])
    end
  end


  #TODO: actually want to define this in terms of what it calls...
  # Remind myslf of my TDD code flow.. That's what can write clean code on the spot.
  #TODO: these should be simple calls to root node.
  # describe 'add_word' do
  #   trie = Trie.new
  #   trie.add_word('Chopper')
  #   # Case sensitive
  #   node = trie.root
  #   it 'adds the word' do
  #     #TODO: reframe with mocks to get()
  #     'Chopper'.split.each do |char|
  #       expect(node.children.length).to eq(1)
  #       expect(node.children[0].).to eq(char)
  #       expect(node.term).to eq(false)
  #       node = node.children[0]
  #     end
  #     expect(node.term).to eq(true)
  #   end
  # end

  # describe 'has_word?' do
  #   trie = Trie.new
  #   trie.add_word('Chopper')
  #   trie.add_word('Car')
  #
  #   it 'matches complete words but not partial' do
  #     expect(trie.has_word?('Chopper')).to eq(true)
  #     expect(trie.has_word?('Chop')).to eq(false)
  #
  #     expect(trie.has_word?('Car')).to eq(true)
  #     expect(trie.has_word?('C')).to eq(false)
  #   end
  # end
end
