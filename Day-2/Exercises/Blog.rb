require "date"

class Blog
  def initialize
    @posts = []
  end

  def add_post post
    @posts << post
  end

  def publish_front_page
    @posts.each do |post|
      title = post.sponsored ? "*** #{post.title} ***" : post.title
      puts "#{title}\n==================\n#{post.text}\n---------------------\n\n\n"
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
