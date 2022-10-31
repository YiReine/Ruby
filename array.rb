#!/usr/bin/ruby

class MinArray
	@@a=[]
	def self.getA
		@@a
	end
	
	@min = Float::INFINITY
	@loc = 0
	
	class << self
	    attr_accessor :min
	    attr_accessor :loc
	end

	
	def self.inputArrayAndFindMin
	
		puts "Nhap mang"

		99.times do |i|
			print "a[#{i}] = "
			b = gets.chomp
			c = b.to_i
			break if c == -1	
		 
			if c < 0 || b != c.to_s
				puts "Gia tri nhap khong phai so tu nhien, moi nhap lai"
				redo
			end
			
			if c < @min 
				@min = c
				@loc = i
			end
			@@a[i]=c
		end
		
		return @min,@loc
	end
	def self.outputArray
		puts "Xuat mang"
		print @@a,"\n"
	end
end

#Run
min, loc = MinArray.inputArrayAndFindMin
MinArray.outputArray
puts "Min: #{min} - Location: #{loc}"
puts "Min by method: #{MinArray.getA.min}"

