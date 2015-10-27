require "pry"
require "securerandom"

class Car
  def initialize noise = "Broom"
    @noise = noise
    @file =  "#{SecureRandom.hex(4)}.txt"
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

class RacingCar < Car
  def initialize
    super("BROOOOOOOM")
  end
end

car = RacingCar.new
car.make_noise
