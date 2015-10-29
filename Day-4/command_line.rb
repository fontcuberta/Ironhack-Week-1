require "digest/sha1"

class User
  def initialize
    @users = [{:name => "Ruben", :password => "7110eda4d09e062aa5e4a390b0a572ac0d2c0220"}, {:name => "user", :password => "7110eda4d09e062aa5e4a390b0a572ac0d2c0220"}]
    @logged_in = false
  end

  def log_in
    puts "Username:"
    user = gets.chomp

    puts "Password:"
    password = gets.chomp

    authenticate user, password
  end

  def logged_in?
    @logged_in
  end

  def get_user user
    @users.find {|u| u if u[:name].downcase == user.downcase}
  end

  private

  def authenticate user, password
    if check_password user, password
      @logged_in = true
      puts "Logged in successfully"
    else
      puts "Incorrect username/password, try again."
      log_in
    end
  end

  def check_password user, password
    Digest::SHA1.hexdigest(password) == get_user(user.downcase)[:password]
  end
end

class CommandLine
  def initialize user
    @user = user
  end

  def run
    if @user.logged_in?
      sentence = get_text
      puts "Your sentence has #{count_words sentence} words!"
    else
      puts "You have to be logged in to use the command line!"
    end
  end

  private

  def get_text
    puts "Introduce a sentence:"
    gets.chomp
  end

  def count_words sentence
    sentence.split(" ").size
  end
end

user = User.new
user.log_in
command_line = CommandLine.new user
command_line.run
