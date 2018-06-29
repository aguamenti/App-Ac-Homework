class LRUCache
  attr_accessor :cache
  attr_reader :capacity

  def initialize(length)
    @capacity = length
    @cache = Array.new()
  end

  def count
    # returns number of elements currently in cache
    cache.length
  end

  def add(el)
    # adds element to cache according to LRU principle
    if cache.include?(el)
      cache.delete(el)
    elsif cache.length >= capacity
      cache.shift
    end
    cache.push(el)
  end

  def show
    # shows the items in the cache, with the LRU item first
    print cache
  end

  private
  # helper methods go here!

end
