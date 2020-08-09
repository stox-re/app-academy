def reverser(string, &prc)
    prc.call(string.reverse)
end

def word_changer(sentance, &prc)
    new_array = []
    sentance.split(" ").each do |word|
        new_array.push(prc.call(word))
    end
    new_array.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    prc1.call(num) > prc2.call(num) ? prc1.call(num) : prc2.call(num)
end

def and_selector(array, prc1, prc2)
    new_array = []
    array.each do |num|
        if prc1.call(num) && prc2.call(num)
            new_array << num
        end
    end
    new_array
end

def alternating_mapper(array, prc1, prc2)
    new_array = []
    array.each_with_index do |num, idx|
        if idx % 2.0 == 0
            new_array << prc1.call(num)
        elsif
            new_array << prc2.call(num)
        end
    end
    new_array
end