#!/usr/bin/ruby
require "rails"
require "active_record"
require "csv"
require "pg"
require "benchmark"
def caculate_time
time = Benchmark.realtime do
        yield
end
        puts "Time: #{time.round(2)}"
end




ActiveRecord::Base.establish_connection(:adapter => "postgresql",
					:host => "localhost",
                                        :username => "postgres",
                                        :password => "123",
                                        :database => "nhi")

class Post < ActiveRecord::Base
  validates :title, presence: true
end

Post.connection.execute <<-SQL
  DROP TABLE IF EXISTS imports;
  CREATE  TABLE imports
  (
    name character varying,
    email character varying,
    phone character varying,
    address character varying,
    date_of_birth timestamp with time zone,
    profile character varying,

    primary key(name)
  )
SQL


caculate_time do
File.open('ha.csv', 'r') do |file|
  Post.connection.raw_connection.copy_data %{copy imports from stdin with csv delimiter ',' quote '"'} do
    file.gets
    while line = file.gets do
      Post.connection.raw_connection.put_copy_data line
    end
  end
end

Post.connection.execute <<-SQL
  insert into imports(name, email, phone, address, date_of_birth, profile)
  select name, email, phone, address, date_of_birth, profile
  from imports
  on conflict(name) do 
  update set
	name = EXCLUDED.name,
	email = EXCLUDED.email,
	phone = EXCLUDED.phone,
	address = EXCLUDED.address,
	date_of_birth = EXCLUDED.date_of_birth,
	profile = EXCLUDED.profile
  returning name
SQL

end

#Time run: 17s
