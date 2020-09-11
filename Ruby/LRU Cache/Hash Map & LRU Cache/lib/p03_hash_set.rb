class HashSet
  attr_reader :count
  BUCKET_RESIZE = 2

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !include?(key)
      self[key.hash] << key
      @count += 1
      resize! if @count >= num_buckets
      return true
    end
    false
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    if self[key.hash].include?(key)
      self[key.hash].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @count = 0
    previous_buckets = @store.dup
    @store = Array.new(num_buckets * BUCKET_RESIZE) { Array.new }

    previous_buckets.each do |sub_array|
      sub_array.each do |ele|
        insert(ele)
      end
    end
  end
end
