require "pry"

def get_name
  puts "What's your name?"
  return gets.chomp
end

def get_guess
  puts "What number I'm thinking?"
  gets.chomp.to_i
end

def check_num number, guess
  if guess == number
    puts "Yeeeeaaaaahhh! You're right! :D"
    return true
  elsif guess < number
    puts "The number is higher! What number I'm thinking?"
    return false
  elsif guess > number
    puts "The number is lower! What number I'm thinking?"
    return false
  end
end

def game
  name = get_name
  guess = get_guess
  number = rand(10)
  lifes = 5
  is_active = true

  while is_active
    if lifes > 1
      if check_num number, guess
        is_active = false
      else
        lifes -= 1
        guess = gets.chomp.to_i
      end
    else
      puts "You've ran out of lifes! Try again! :D"
      is_active = false
    end
  end
end

game
