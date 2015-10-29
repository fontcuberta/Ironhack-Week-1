require "pry"

module Camera
  def take_photo
    puts "Photo taken in #{@operative_system}"
  end
end

class Device
  include Clock

  def initialize operative_system, screen_inches
    @operative_system = operative_system
    @screen_inches = screen_inches
  end

  def prints_time
    puts Time.now
  end
end

class Phone < Device
  include Camera

  def initialize operative_system, screen_inches, agenda
    super operative_system, screen_inches
    @agenda = agenda
  end

  def show_contacts
    @agenda.get_contacts.each {|contact| puts "#{contact[:name]}: #{contact[:phone]}"}
  end

  def add_contact name, phone
    @agenda.add_contact name, phone
  end

  def call name
    contact = @agenda.get_contact name
    puts "Calling #{contact[:name]} (#{contact[:phone]})..."
  end
end

class SmartWatch < Device
  include Camera

  def prints_time
    puts "***#{Time.now}****"
  end
end

class Laptop < Device
  def initialize operative_system, screen_inches, touchable
    super operative_system, screen_inches
    @touchable = touchable
  end
end

class Agenda
  def initialize
    @contacts = []
  end

  def add_contact name, phone
    @contacts << { name: name, phone: phone }
  end

  def get_contact name
    @contacts.find { |contact| contact if contact[:name] == name }
  end

  def get_contacts
    @contacts
  end

  def search_contacts name
    @contacts.select { |contact| contact if contact[:name] == name }
  end
end

class MicroWave
  include Clock

  def heat_food
    puts "Heating food, wait!"
  end

  def prints_time
    puts Time.now
  end
end


phone = Phone.new "iOS", 5, Agenda.new
phone.prints_time
phone.take_photo
phone.add_contact "Tom", 665667663
phone.add_contact "Bob", 535345345
phone.add_contact "Sam", 433453464
phone.show_contacts
phone.call "Tom"

sw = SmartWatch.new "Android", 2
sw.prints_time
sw.take_photo

l = Laptop.new "Ubuntu", 15, false
l.prints_time

mw = MicroWave.new
mw.heat_food
mw.prints_time
