#!/usr/bin/ruby

numbers = [3, 5, -4, 8, 11, 1, -1, 6]
sum = 10
def check_have_target_sum numbers,sum
	result = []

	map = Hash.new

	for n in numbers do 
	  if map[n] == (sum - n)
		result = [(sum-n), n]
		return result
	  end
	map[sum-n]=n
	end
	return result
end

print check_have_target_sum(numbers,sum), "\n"
