class Array
  def my_uniq(array)
    new_array = []

    array.each do |ele|
      if !new_array.include?(ele)
        new_array << ele
      end
    end

    new_array
  end

  def two_sum(array)
    new_array = []

    array.each_with_index do |ele, index|
      array.each_with_index do |ele_check, index_check|
        if index_check > index
          if ele + ele_check == 0
            new_array << [index, index_check]
          end
        end
      end
    end
    new_array
  end

  def my_transpose(array_2d)
    new_transposed_array = Array.new(array_2d.length) { Array.new() }
    array_2d.each_with_index do |num, idx|
        array_2d[idx].each_with_index do |num_inside, idx_inside|
            new_transposed_array[idx_inside].push(num_inside)
        end
    end
    new_transposed_array
  end

  def stock_picker(array_of_days)
    [array_of_days.index(array_of_days.min), array_of_days.index(array_of_days.max)]
  end
end
