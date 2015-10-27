class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Sevilla", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49)
]

def sort_homes_by type, arr
  if type.downcase == "price asc"
    arr.sort {|a, b| a.price <=> b.price}
  elsif type.downcase == "price desc"
    arr.sort {|a, b| b.price <=> a.price}
  elsif type.downcase == "capacity asc"
    arr.sort {|a, b| a.capacity <=> b.capacity}
  elsif type.downcase == "capacity desc"
    arr.sort {|a, b| b.capacity <=> a.capacity}
  else
    arr.sort {|a, b| a.price <=> b.price}
  end
end

def find_city city, arr
  if city.empty?
    arr
  else
    arr.select { |h| h.city.downcase == city.downcase }
  end
end

def find_price price, arr
  if price.empty?
    arr
  else
    arr.select { |h| h.price == price.to_i }
  end
end

def average_price arr
  prices = arr.map { |h| h.price }
  price_average = prices.reduce(0.0) {|sum, p| sum + p} / prices.size

  puts "Average price is: #{price_average}"
end

# Sorting
puts "Introduce the sorting method (price ASC, price DESC, capacity ASC, capicity DESC): "
sorting = gets.chomp
sorted_homes = sort_homes_by sorting, homes

# Filter by city
puts "Introduce a city name to filter the homes by city:"
filter = gets.chomp
filtered_by_city = find_city filter, sorted_homes

# Filter by price
puts "Introduce a price to filter the homes with that price:"
price = gets.chomp
filter_by_price = find_price price, filtered_by_city

filter_by_price.each do |h|
  puts "\n#{h.name} in #{h.city}\nPrice $#{h.price} a night\n\n"
end

# Average price
average_price filter_by_price
