# Quick Sort Algorithm

def quick_sort(arr)
    return arr if arr.length <= 1
    pivot_arr = [arr.first]
    left_side = arr[1..-1].select { |el| el < arr.first }
    right_side = arr[1..-1].select { |el| el > arr.first }
    quick_sort(left_side) + pivot_arr + quick_sort(right_side)
end

arr = [6,2,3,7,5,3,1]
p quick_sort(arr)