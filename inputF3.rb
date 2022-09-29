require 'pg'
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


def inputPG
	# Initialize connection variables.
	host = String('localhost')
	database = String('nhi')
	user = String('postgres')
	password = String('123')

	# Initialize connection object.
    connection = PG::Connection.new(:host => host, :user => user, :dbname => database, :port => '5432', :password => password)
    puts 'Successfully created connection to database'

    # Drop previous table of same name if one exists
    connection.exec('DROP TABLE IF EXISTS ha;')
    puts 'Finished dropping table (if existed).'

    # Drop previous table of same name if one exists.
    connection.exec('CREATE TABLE ha (name VARCHAR(255) PRIMARY KEY, email VARCHAR(255), phone VARCHAR(50), address VARCHAR(100), date_of_birth DATE, profile VARCHAR(255));')
    puts 'Finished creating table.'

    # Insert some data into table.
    connection.exec("COPY ha FROM \'/home/nhi/Desktop/ruby-basic/ha.csv\' DELIMITER \',\' CSV HEADER;")
	puts 'Inserted data.'

rescue PG::Error => e
    puts e.message

ensure
    connection.close if connection
end
print_memory_usage do
	caculate_time do
		inputPG
	end
end

#Time run: 14s
