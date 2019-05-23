require_relative "environment"

Scraper.new(@db).scrape

all_pokemon = @db.execute("SELECT * FROM pokemon;")

fire_types = @db.execute("SELECT * FROM pokemon WHERE type LIKE \"%Fire%\"")
water_types = @db.execute("SELECT * FROM pokemon WHERE type LIKE \"%Water%\"")
poison_types = @db.execute("SELECT * FROM pokemon WHERE type LIKE \"%Poison%\"")
flying_types = @db.execute("SELECT * FROM pokemon WHERE type LIKE \"%Flying%\"")
electric_types = @db.execute("SELECT * FROM pokemon WHERE type LIKE \"%Electric%\"")
types = @db.execute("SELECT type, count(type) FROM pokemon GROUP BY type")
electric_types.each do |data|
  puts "======================================"
  puts "Number: #{data[0]}"
  puts "Name: #{data[1]}"
  puts "Type: #{data[2]}"
end
