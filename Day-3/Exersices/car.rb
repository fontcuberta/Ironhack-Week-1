class Engine
  def make_noise
    puts "Engine noise"
  end
end

class ElectricEngine < Engine
  def make_noise
    puts "Electric engine noise"
  end
end

class QuantumEngine < Engine
  def make_noise
    puts "Quantum engine noise"
  end
end

class Car
  def initialize noise, engine
    @noise = noise
    @engine = engine
  end

  def make_noise
    @engine.make_noise
    puts @noise
  end
end

e = ElectricEngine.new
c = Car.new "Brooooom", e
c.make_noise
