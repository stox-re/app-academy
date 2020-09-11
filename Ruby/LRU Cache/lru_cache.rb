  class LRUCache
    def initialize(size)
      @store = Array.new(size)
      @accessed = []
      @size = size
    end

    def count
      @store.count
    end

    def add(el)
      @store.delete(el) if @store.include?(el)
      @store.shift if count >= @size
      @store << el
    end

    def show
      p @store
    end
  end

johnny_cache = LRUCache.new(4)
johnny_cache.add("I walk the line")
johnny_cache.add(5)
johnny_cache.count # => returns 2
johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]