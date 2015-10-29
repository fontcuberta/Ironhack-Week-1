require "pry"

class Twitter
  def initialize file
    @content = File.read(file)
    @lines = []
    @conversations = {}
    @solved = {}

    save_conversations
  end

  def file_to_lines
    @content.each_line {|line| @lines << line}
  end

  def parse_name text
    text.gsub(/(\w+)+:/).first.gsub(/(\w+)/).first
  end

  def parse_mentions text
    text.gsub(/@+(\w+)/).map { |m| m.gsub(/(\w+)/).first}
  end

  def save_name name
    @conversations[name] = [] unless @conversations.has_key?(name)
  end

  def save_mentions name, mentions
    mentions.each do |m|
      @conversations[name] << m unless @conversations[name].include?(m)
    end
  end

  def save_conversations
    file_to_lines

    @lines.each do |line|
      user_name = parse_name line
      mentions = parse_mentions line

      save_name user_name
      save_mentions user_name, mentions
    end
  end

  def run
    puts @conversations
  end
end

twitter = Twitter.new("twitter_input.txt")
twitter.run


# {
#   "alberta"   => ["bob", "christie", "duncan"],
#   "bob"       => ["alberta", "duncan", "christie"],
#   "christie"  => ["alberta", "bob", "emily"],
#   "duncan"    => ["bob", "emily", "farid"],
#   "emily"     => ["duncan", "christie"], "farid"=>["duncan"]
# }


# test = {
#   "alberta": [["bob", "christie"], ["duncan", "emily"], ["farid"]]
# }
