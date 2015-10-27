require "pry"

class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

class Airbnb
  def initialize(homes)
    @homes = homes
    @working_homes = homes
    show_homes
    menu
  end

  def menu
    puts "\nMenu:\n1 - Sort by price\n2 - Sort by capacity\n3 - Find by price\n4 - Find by city\n5 - Reset filter"
    option = gets.chomp

    if option == "1"
      puts "You can sort by (asc)ending order or (desc)ending order."
      puts "Example: price asc"
      option = gets.chomp.split
      sort option[0], option[1]

    elsif option == "2"
      puts "You can sort by (asc)ending order or (desc)ending order."
      puts "Example: capacity asc"
      option = gets.chomp.split
      sort option[0], option[1]

    elsif option == "3"
      puts "You can find by price."
      puts "Example: price 50"
      option = gets.chomp.split
      find option[0], option[1]

    elsif option == "4"
      puts "You can find by city."
      puts "Example: city sevilla"
      option = gets.chomp.split
      find option[0], option[1]

    elsif option == "5"
      reset

    else
      menu
    end

    show_homes
    menu
  end

  def reset
    @working_homes = @homes
  end

  def sort_price order
    if order == "asc"
      @working_homes = @working_homes.sort { |a, b| a.price <=> b.price }
      binding.pry
    elsif order == "desc"
      @working_homes = @working_homes.sort { |a, b| b.price <=> a.price }
    end
  end

  def sort_capacity order
    if order == "asc"
      @working_homes = @working_homes.sort { |a, b| a.capacity <=> b.capacity }
    elsif order == "desc"
      @working_homes = @working_homes.sort { |a, b| b.capacity <=> a.capacity }
    end
  end

  def sort type, order
    if type == "price"
      sort_price order
    elsif type == "capacity"
      sort_capacity order
    end
  end

  def find type, query
    if type == "city"
      @working_homes = @working_homes.select { |h| h.city == query }
    elsif type == "price"
      @working_homes = @working_homes.select { |h| h.price == query.to_i }
    end
  end

  def average_price
    prices = @working_homes.map { |h| h.price }
    price_average = prices.reduce(0.0) { |sum, p| sum + p } / prices.size

    puts "Average price is: #{price_average}"
  end

  def show_homes
    @working_homes.each do |h|
      puts "\n#{h.name} in #{h.city}\nPrice $#{h.price} a night\n\n"
    end

    average_price
  end
end

homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Sevilla", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49)
]


Airbnb.new(homes);
