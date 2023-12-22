require 'json'

class Census
  def initialize
    @data = {}
  end

  def add_resident(name, nationality, address)
    resident_id = @data.length + 1
    @data[resident_id] = {
      'name' => name,
      'nationality' => nationality,
      'address' => address
    }
    puts "Resident #{resident_id} added successfully."
  end

  def export_data(filename)
    File.open(filename, 'w') do |file|
      file.puts JSON.pretty_generate(@data)
    end
    puts "Data exported to #{filename}."
  end
end

def main
  census = Census.new

  puts "Welcome to the Population and Housing Census System"

  loop do
    puts "\n1. Add Resident"
    puts "2. Export Data"
    puts "3. Exit"

    print "Enter your choice (1/2/3): "
    choice = gets.chomp

    case choice
    when '1'
      print "Enter resident's name: "
      name = gets.chomp
      print "Enter resident's nationality: "
      nationality = gets.chomp
      print "Enter resident's address: "
      address = gets.chomp
      census.add_resident(name, nationality, address)

    when '2'
      print "Enter the filename to export data: "
      filename = gets.chomp
      census.export_data(filename)

    when '3'
      puts "Exiting the Population and Housing Census System."
      break

    else
      puts "Invalid choice. Please enter a valid option."
    end
  end
end

main
#coding by Mauritania injector >> M-INJECTOR0X00
