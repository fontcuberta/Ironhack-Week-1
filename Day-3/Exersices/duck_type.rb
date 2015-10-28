class Car
  attr_reader :name, :wheels

  def initialize wheels, noise
    @wheels = wheels
    @noise = noise
  end

  def make_noise
    puts @noise
  end
end

class Motorcycle
  attr_reader :name, :wheels

  def initialize wheels, noise
    @wheels = wheels
    @noise = noise
  end

  def make_noise
    puts @noise
  end
end

class WheelCounter
  def initialize vehicles
    @vehicles = vehicles
  end

  def count
    @vehicles.each do |v|
      puts "It has #{v.wheels}"
    end
  end
end

class NoiseReader
  def initialize vehicles
    @vehicles = vehicles
  end

  def show_noises
    @vehicles.each do |v|
      v.make_noise
    end
  end
end

car = Car.new 4, "Brooom"
motorcycle = Motorcycle.new 2, "BrOoOoOoOM"

vehicles = [car, motorcycle]

counter = WheelCounter.new vehicles
counter.count

noise = NoiseReader.new vehicles
noise.show_noises
