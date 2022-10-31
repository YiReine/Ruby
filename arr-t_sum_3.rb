#!/usr/bin/ruby

numbers = [12, 3, 1, 2, -6, 5, -8, 6] #[3, 5, -4, 8, 11, 1, -1, 6]
sum = 0 #22
def check_have_target_sum numbers,sum
	result = []

	sub_arr = numbers.combination(3).to_a
	for sa in sub_arr do
		if (sa.sum == sum)
			result.append(sa)
		end

	end
	
	return result
end

print check_have_target_sum(numbers,sum), "\n"
