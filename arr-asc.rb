#!/usr/bin/ruby

a=[]
def input_n
	n = 0 
	loop do
		print "Nhap n: "
		n = gets.chomp
		m = n.to_i
		unless m.to_s != n || m > 99 || m <= 0
	   		break
		end
	end
	return n.to_i
end

def output_subarr_asc(a, n)
        c = 2
        print "Mang con tang 1: "
        (n-1).times do |i|
                if a[i] <= a[i+1]
                   print a[i],", "
                else
                   puts a[i]
                   print "Mang con tang #{c}: "
                   c+=1
                end
        end
        puts a[n-1]
end


n = input_n

n.times do |i|
	a[i] = rand(1...10)
end

puts "Xuat mang"
print a,"\n"

output_subarr_asc(a,n)

