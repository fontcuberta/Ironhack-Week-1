class Muffin
  @@bakery = "Ironhack muffins & stuff"

  def initialize color = "brown", flavour = "chocolate"
    @color = color
    @flavour = flavour
  end

  def eat
    puts "This #{@bakery} muffin is awesome! It tastes like #{@flavour}!"
  end

  def self.bakery?
    puts "The muffins are made by '#{@@bakery}'"
  end

  def show_bakery
    @@bakery
  end
end

Muffin.bakery?
muffin = Muffin.new "green", "mint"
muffin.eat
