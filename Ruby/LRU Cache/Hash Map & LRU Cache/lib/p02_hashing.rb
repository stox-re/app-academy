class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    self.each_with_index.inject(0) do |hash, (num, index)|
      (num.hash + index.hash)
    end
  end
end

class String
  def hash
    char_int_array = []
    self.each_char do |char|
      char_int_array << char.ord
    end
    char_int_array.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    array = Array.new
    self.each do |key, value|
      array << [key, value]
    end
    array.sort.hash
  end
end
