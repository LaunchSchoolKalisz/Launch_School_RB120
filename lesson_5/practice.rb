def joinor(nums, punctuation = ", ", conjunction = "or")
  case nums.count 
  when 1
    nums.join(punctuation.to_s)
  when 2
    "#{nums[0]} #{conjunction} #{nums[1]}"
  else
    last_num = nums.pop
    nums.join(punctuation.to_s) + "#{punctuation}#{conjunction} #{last_num}"
  end
end

p joinor([1, 2])                   # => "1 or 2"
p joinor([1, 2, 3])                # => "1, 2, or 3"
p joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"