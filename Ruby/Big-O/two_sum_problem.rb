def bad_two_sum?(arr, target_sum)
    arr.each_with_index do |ele, idx|
      arr.each_with_index do|ele_next, idx_next|
        if idx_next > idx
          return true if ele + ele_next == target_sum
        end
      end
    end
    false
end

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(array, target_sum)
  sorted = array.sort
  sorted.each_with_index do |ele, idx|
    if idx + 1 < sorted.length - 1
      return true if sorted[idx] + sorted[idx + 1] == target_sum
    end
  end
  false
end

p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false

def two_sum?(array, target_sum)
  hash = Hash.new
  array.each do |ele|
    return true if hash[target_sum - ele]
    hash[ele] = true
  end
  false
end

p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false
