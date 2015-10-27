class Car
  def initialize noise = "Broom"
    @noise = noise
    @cities = []
  end

  def make_noise
    puts @noise
  end

  def add_city city
    @cities << city
  end

  def cities
    @cities
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
