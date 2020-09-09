def first_anagram(string, string_two)
  all_permutations = string.split("").permutation.to_a
  joined_permutations = []

  all_permutations.each do |permutation|
    joined_permutations << permutation.join("")
  end

  joined_permutations.include?(string_two)
end

p first_anagram("elvis", "lives")    #=> true

def second_anagram(string_one, string_two)
  string_two_split = string_two.split("")

  string_one.split("").each_with_index do |char, index|
    index_of = string_two_split.index(char)
    if index_of != nil
      string_two_split.delete_at(index_of)
    end
  end

  return true if string_two_split.length == 0
  false
end

p second_anagram("gizmo", "sally")    #=> false
p second_anagram("elvis", "lives")    #=> true

def third_anagram(string_one, string_two)
  string_one.chars.sort.join == string_two.chars.sort.join
end

p second_anagram("gizmo", "sally")    #=> false
p second_anagram("elvis", "lives")    #=> true
