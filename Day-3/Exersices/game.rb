require "pry"
class Room
  attr_reader :directions

  def initialize description, north, south, east, west
    @directions = {
      :description => description,
      :N => north,
      :S => south,
      :E => east,
      :W => west
    }
  end

  def show_description
    puts @directions[:description]
  end

  def play option
    @directions[option.to_sym]
  end
end

class Forest < Room
  def play option
    @directions[option.to_sym]
  end
end

class Game
  def initialize rooms
    @rooms = rooms
    @current_room = rooms.first
  end

  def show_room
    @current_room.show_description
    puts ">"
    option = gets.chomp
    next_room = @current_room.play option
    @current_room = @rooms[next_room.nil? ? @current_room : next_room]
    show_room
  end

  def start
    show_room
  end
end

start = Room.new "You are in a dark room. There is a door at the north", 1, false, false, false
forest = Forest.new "You are in the forest. There is a lot of light. There is a bear sleeping\nYou can see a sword", false, 0, false, false

rooms = [start, forest]

game = Game.new rooms
game.start
