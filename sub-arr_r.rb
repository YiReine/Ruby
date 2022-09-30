#!/usr/bin/ruby

a = [5, 1, 22, 26, 6, -1, 8, 10]
b = [1, 6, -1, 10]

def check_sub_arr a,b
	j=0
	for i in a do
	  if b[j] == i
		j+=1
	  end
	end
	if j == b.length
		return true
	end
	return false
end

puts check_sub_arr a,b

