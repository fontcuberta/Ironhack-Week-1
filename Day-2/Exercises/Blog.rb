require "date"
require "io/console"

class Blog
  def initialize
    @posts = []
    @total_pages = @posts.size / 3
    @page = 1
  end

  def add_post post
    @posts << post
    @total_pages = @posts.size / 3
  end

  def publish_front_page
    posts_to_show = create_front_page

    posts_to_show.each do |post|
      title = post.sponsored ? "*** #{post.title} ***" : post.title
      puts "#{title}\n==================\n#{post.text}\n---------------------\n\n\n"
    end

    show_pagination
  end

  def create_front_page
    from_post = (@page - 1) * 3
    to_post = from_post + 2
    @posts[from_post..to_post]
  end

  # Reads keypresses from the user including 2 and 3 escape character sequences.
  # https://gist.github.com/acook/4190379
  
  def read_char
    STDIN.echo = false
    STDIN.raw!

    input = STDIN.getc.chr
    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil
      input << STDIN.read_nonblock(2) rescue nil
    end
  ensure
    STDIN.echo = true
    STDIN.cooked!

    return input
  end

  def show_pagination
    pages = ""

    (1..@total_pages).each do |t|
      t == @page ? pages << "|#{t}| " : pages << "#{t} "
    end

    puts pages
    puts "Use arrow keys to move between pages."

    input = read_char

    if input == "\e[D"
      @page = (@page - 1 < 1) ? @page = @total_pages : @page -= 1
      publish_front_page
    elsif input == "\e[C"
      @page = (@page + 1 > @total_pages) ? @page = 1 : @page += 1
      publish_front_page
    end
  end
end

class Post
  attr_reader :title, :date, :text, :sponsored

  def initialize title, date, text, sponsored = false
    @title = title
    @date = date
    @text = text
    @sponsored = sponsored
  end
end

blog = Blog.new
blog.add_post Post.new("Post 1", Date.new(2015, 05, 03), "This is the body of the post 1.")
blog.add_post Post.new("Post 2", Date.new(2015, 04, 04), "This is the body of the post 2.", true)
blog.add_post Post.new("Post 3", Date.new(2015, 10, 15), "This is the body of the post 3.")
blog.add_post Post.new("Post 4", Date.new(2015, 12, 02), "This is the body of the post 4.")
blog.add_post Post.new("Post 5", Date.new(2015, 03, 15), "This is the body of the post 5.")
blog.add_post Post.new("Post 6", Date.new(2015, 01, 25), "This is the body of the post 6.", true)
blog.add_post Post.new("Post 7", Date.new(2015, 06, 15), "This is the body of the post 7.")
blog.add_post Post.new("Post 8", Date.new(2015, 11, 21), "This is the body of the post 8.")
blog.add_post Post.new("Post 9", Date.new(2015, 11, 10), "This is the body of the post 9.", true)

blog.publish_front_page
