require_relative 'trie'

RSpec.describe Node do
  describe 'get' do
    node = Node.new('H')
    node.children = [Node.new('i'), Node.new('o')]
    it 'grabs matching node' do

    end

    it 'returns nil for non-matching' do

    end

  end
end

#TODO: make sure we implement 4 part test pattern
RSpec.describe Trie do
  describe 'initialize' do
    trie = Trie.new
    it 'initializes null root node' do
      expect(trie.root.value).to eq(nil)
    end

    it 'initializes root node with no children' do
      expect(trie.root.children).to eq([])
    end
  end

  #TODO: actually want to define this in terms of what it calls...
  # Remind myslf of my TDD code flow.. That's what can write clean code on the spot.
  describe 'add_word' do
    trie = Trie.new
    trie.add_word('Chopper')
    # Case sensitive
    node = trie.root
    it 'adds the word' do
      'Chopper'.split.each do |char|
        expect(node.children.length).to eq(1)
        expect(node.children[0].value).to eq(char)
        expect(node.word_end).to eq(false)
        node = node.children[0]
      end
      expect(node.word_end).to eq(true)
    end
  end

  describe 'adding two words' do
    trie = Trie.new
    trie.add_word('Chopper')
    trie.add_word('Car')

    node = trie.root.children[0]
    it 'splits at joint letters' do
      expect(node.children.length).to eq(2)
      expect([node.children[0].value, node.children[1].value]).to eq(['h', 'a'])
    end
  end

  describe 'has_word?' do
    trie = Trie.new
    trie.add_word('Chopper')
    trie.add_word('Car')

    it 'matches complete words but not partial' do
      expect(trie.has_word?('Chopper')).to eq(true)
      expect(trie.has_word?('Chop')).to eq(false)

      expect(trie.has_word?('Car')).to eq(true)
      expect(trie.has_word?('C')).to eq(false)
    end
  end
end
