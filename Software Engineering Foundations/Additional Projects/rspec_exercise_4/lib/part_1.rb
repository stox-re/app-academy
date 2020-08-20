def my_reject(array, &prc)
    new_array = array.select do |ele|
        if !prc.call(ele)
            ele
        end
    end
    new_array
end

def my_one?(array, &prc)
    true_count = 0
    array.each do |ele|
        if prc.call(ele)
            true_count += 1
        end
    end
    return true if true_count == 1
    false
end

def hash_select(hash, &prc)
    new_hash = {}
    hash.each do |key, value|
        if prc.call(key, value)
            new_hash[key] = value
        end
    end
    new_hash
end

def xor_select(array, *prc)
    selected_array = []
    array.each do |ele|
        if prc[0].call(ele) && prc[1].call(ele)
        elsif prc[0].call(ele) || prc[1].call(ele)
            selected_array << ele
        end
    end
    selected_array
end

def proc_count(value, prc_array)
    count = 0
    prc_array.each do |this_prc|
        if this_prc.call(value)
           count += 1
        end
    end
    count
end
