def longest_fish_n(array)
  longest = array[0]
  array.each do |item|
    if item.length > longest.length
      longest = item
    end
  end
  longest
end

p longest_fish_n(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])

def longest_fish_n2(array)
  longest = array[0]
  array.each_with_index do |item, index|
    array.each_with_index do |item_next, index_next|
      if index_next > index
        if item_next.length > item.length
          longest = item_next
        end
      end
    end
  end
  longest
end

p longest_fish_n2(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])


tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(item, array)
  array.index(item)
end

p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)
