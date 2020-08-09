def my_map(array, &prc)
    new_array = []
    array.each do |num|
        new_array << prc.call(num)
    end
    return new_array
end

def my_select(array, &prc)
    new_array = []
    array.each do |num|
        if prc.call(num)
            new_array << num
        end
    end
    return new_array
end

def my_count(array, &prc)
    count = 0
    array.each do |num|
        if prc.call(num)
            count += 1
        end
    end
    return count
end

def my_any?(array, &prc)
    found_even = false
    array.each do |num|
        if prc.call(num)
            found_even = true
        end
    end
    return found_even
end

def my_all?(array, &prc)
    found_odd = true
    array.each do |num|
        if !prc.call(num)
            found_odd = false
        end
    end
    return found_odd
end

def my_none?(array, &prc)
    found_no_even = true
    array.each do |num|
        if prc.call(num)
            found_no_even=false
        end
    end
    found_no_even
end
