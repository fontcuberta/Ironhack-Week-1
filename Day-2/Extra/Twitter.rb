class Twitter
  def initialize file
    @content = File.read(file)
    @lines = []
    @conversations = {}
  end

  def file_to_lines
    @content.each_line {|line| @lines << line}
  end

  def save_name name
    @conversations[name] = [] unless @conversations.has_key?(name)
  end

  def save_mentions name, mentions
    mentions.each do |m|
      @conversations[name] << m unless @conversations[name].include?(m)
    end
  end

  def check_conversation
    @conversations.each do |user, dest|
      puts "The user #{user} has talked to:"
      dest.each do |d|
        puts "- #{d}" if @conversations[d].include?(user)
      end
    end
  end

  def parse_users
    file_to_lines

    @lines.each do |line|
      user_name = line.gsub(/(\w+)+:/).first.gsub(/(\w+)/).first
      mentions = line.gsub(/@+(\w+)/).map { |m| m.gsub(/(\w+)/).first}

      save_name user_name
      save_mentions user_name, mentions
    end
  end

  def show_conversations
    file_to_lines
    parse_users
    check_conversation
    # @conversations.each do |user, mentions|
    #   puts "User #{user} mentioned:"
    #   mentions.each do |m|
    #     puts m
    #   end
    # end
  end
end

twitter = Twitter.new("twitter_input_long.txt")
twitter.show_conversations
