require "./Muffin"

class Cupcake < Muffin
  def initialize color, flavour, topping
    super(color, flavour)
    @topping = topping
  end
end

c = Cupcake.new "green", "mint", "chocolate"
c.eat
