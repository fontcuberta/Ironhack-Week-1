class Car
  def initialize noise
    @noise = noise
  end

  def make_noise
    puts @noise
  end

  def self.noise car, number = 2
    number.times { car.make_noise }
  end
end

car = Car.new "Broom"
car.make_noise
Car.noise car

noisy_car = Car.new "BROOOOOOOM"
noisy_car.make_noise
Car.noise noisy_car
