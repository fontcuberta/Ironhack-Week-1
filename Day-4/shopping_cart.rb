require "pry"

class Shop
  def initialize cart
    @cart = cart
  end

  def checkout
    @cart.each do |item|
    end
  end
end

class ShoppingCart
  def initialize
    @cart = {}
  end

  def add_item_to_cart item
    item_qty = @cart[item.get_name] ? @cart[item.get_name][:count] +  1 : 1
    @cart[item.get_name] = {:item => item, :count => item_qty}
  end

  def show
    @cart.each do |item, values|
      puts "#{values[:count]} #{item} $#{values[:count] * values[:item].get_price}"
    end
  end

  def cost
    total = @cart.reduce(0) {|sum, (item, values)| sum + (values[:count] * values[:item].get_price)}

    puts "Total: #{total}"
  end

  def get_cart
    @cart
  end
end

class Item
  def initialize name, price
    @name = name
    @price = price
  end

  def get_name
    @name
  end

  def get_price
    @price
  end
end

class Apple < Item
end

class Banana < Item
end

apple = Apple.new "apple", 10
banana = Banana.new "banana", 20

cart = ShoppingCart.new

cart.add_item_to_cart apple
cart.add_item_to_cart banana
cart.add_item_to_cart banana

cart.show
cart.cost

shop = Shop.new cart.get_cart
shop.checkout
