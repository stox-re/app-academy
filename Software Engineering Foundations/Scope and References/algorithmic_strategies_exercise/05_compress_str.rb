# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    is_consecutive = false
    consecutive_count = 1
    result_array = []
    (0...str.length).each do |i|
        if str[i] == str[i+1]
            is_consecutive = true
            consecutive_count += 1
        else
            if consecutive_count == 1
                result_array.push(str[i])
            else
                result_array.push(consecutive_count, str[i])
                consecutive_count = 1
            end
            is_consecutive = false
        end
    end
    result_array
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
