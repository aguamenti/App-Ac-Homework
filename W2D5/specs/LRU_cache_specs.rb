require 'LRU_Cache'

describe LRUCache do
  subject(:johnny_cache) { LRUCache.new(4) }

  describe "#initialize" do
    it "initializes johnny_cache.cache to an array" do
      expect(johnny_cache.cache).to be(Array)
    end
  end

end
