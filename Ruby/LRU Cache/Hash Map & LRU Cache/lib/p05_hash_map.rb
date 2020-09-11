require_relative 'p04_linked_list'

class HashMap
  attr_accessor :count
  include Enumerable
  BUCKET_RESIZE = 2

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    bucket_node = bucket(key)
    if include?(key)
      bucket_node.update(key, val)
    else
      bucket_node.append(key, val)
      @count += 1
      resize! if @count == num_buckets
    end
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    bucket(key).remove(key)
    @count -= 1
  end

  def each
    @store.each do |bucket|
      bucket.each do |node|
        yield(node.key, node.val)
      end
    end
  end

  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    @count = 0
    previous_buckets = @store.dup
    @store = Array.new(num_buckets * BUCKET_RESIZE) { LinkedList.new }

    previous_buckets.each do |bucket|
      bucket.each do |node|
        self.set(node.key, node.val)
      end
    end
  end

  def bucket(key)
    @store[key.hash % num_buckets]
  end
end
