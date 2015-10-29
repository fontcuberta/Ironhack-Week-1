require 'imdb'
require 'pry'

class Rating
  def initialize(file)
    @file = IO.read(file)
    @movie_ids = []
    @movies = {}
    @graphic = []
  end
  def get_ids
    @file.each_line do |line|
      @movie_ids << Imdb::Search.new(line).movies.first.id
    end
  end
  def get_movies
    get_ids

    @movie_ids.each do |m|
      movie = Imdb::Movie.new(m)
      rating = Array.new(10) { " " }
      (movie.rating.round).times { |t| rating[t] = "#" } if movie.rating
      @movies[m] = [movie.title, rating]
    end
  end

  def create_rating_array
    get_movies

    (0..9).to_a.reverse.each do |number|
      row = ""
      @movies.each do |id, info|
        row += "|#{info[1][number]}"
      end
      row += "|"
      puts row
    end
  end

  def show_movies
    create_rating_array
  end
end

c = Rating.new('movies.txt')
c.show_movies
