def joinor(nums, punctuation = ", ", conjunction = "or")
  if nums.count == 2
    "#{nums[0]} #{conjunction} #{nums[1]}"
  elsif nums.count > 2
    last_num = nums.pop
    nums.join("#{punctuation}") + "#{punctuation}#{conjunction} #{last_num}"
  else
    nums.join("#{punctuation}") 
  end
end

p joinor([1, 2])                   # => "1 or 2"
p joinor([1, 2, 3])                # => "1, 2, or 3"
p joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"