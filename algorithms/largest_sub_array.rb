# https://www.geeksforgeeks.org/largest-sum-contiguous-subarray/

# Note this assumes that [] is a valid sub-array, so it can be used when its all negative numbers.
def max_sub_arr(arr)
  max_so_far = 0
  max_ending_here = 0
  start_i = nil
  end_i = nil
  arr.each_with_index do |el, i|
    if max_ending_here == 0 && max_ending_here + el > 0
      start_i = i
    end

    max_ending_here = max_ending_here + el
    if max_ending_here < 0
      max_ending_here = 0
    end

    if max_so_far < max_ending_here
      max_so_far = max_ending_here
      end_i = i
    end
  end

  return [start_i, end_i], max_so_far
end

puts max_sub_arr([-2, -3, 4, -1, -2, 1, 5, -3]).inspect
