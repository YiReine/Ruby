#!/usr/bin/ruby

puts "Nhap mang"
a = []

min = Float::INFINITY
loc = 0

99.times do |i|
	print "a[#{i}] = "
	b = gets.chomp
	c = b.to_i
        break if c == -1	
 
	if c <= 0 || b != c.to_s
		puts "gia tri nhap khong phai so tu nhien, moi nhap lai"
		redo
	end
	
	if c < min 
		min = c
		loc = i
	end
	a[i]=c
end

puts "Xuat mang"
print a,"\n"

puts "Min by method: #{a.min}"
puts "Min: #{min} - Location: #{loc}"
