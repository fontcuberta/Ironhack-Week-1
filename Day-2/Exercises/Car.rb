require "pry"
require "securerandom"

class Car
  def initialize noise = "Broom"
    @noise = noise
    @cities = []
    @file =  "#{SecureRandom.hex(10)}.txt"
  end

  def make_noise
    puts @noise
  end

  def add_city city
    if File.exists?(@file)
      content = IO.read(@file)
    else
      content = ""
    end

    IO.write(@file, "#{content + city} ")
  end

  def cities
    if File.exists?(@file)
      IO.read(@file).split(" ")
    end
  end

  def self.noise car, number = 2
    number.times { car.make_noise }
  end
end

car = Car.new

car.add_city("London")
car.add_city("Amsterdam")
car.add_city("Madrid")
car.add_city("Paris")

puts car.cities
