#!/usr/bin/ruby

require "benchmark"
def print_memory_usage
      memory_before = `ps -o rss= -p #{Process.pid}`.to_i
      yield
      memory_after = `ps -o rss= -p #{Process.pid}`.to_i

      puts "Memory: #{((memory_after - memory_before) / 1024.0).round(2)} MB"
    end
def caculate_time
time = Benchmark.realtime do
	yield
end
	puts "Time: #{time.round(2)}"
end

print_memory_usage do
caculate_time do
File.open('ha.csv','w+') do |f|
	f.puts "name,Email,Phone,Address,Day_of_Birth,Profile"
	500000.times do |i|
	f.write "Nguyen Van A#{i+1},nguyenvana#{i+1}@gmail.com,123456789,Ho Chi Minh city,2000/01/01,"
	f.puts '"Like TV 100"", Some special charactor: \ / \' $ ~ & @ # ( ; """'

	end
end
end
end
