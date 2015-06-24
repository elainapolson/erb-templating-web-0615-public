require 'pry'
class Movie

  attr_accessor :id, :title, :release_date, :director, :summary

  @@all = []

  def initialize(title, release_date, director, summary)
    @id = id
    @title = title
    @release_date = release_date
    @director = director
    @summary = summary
    @@all << self
  end

  def url
    "#{self.title.downcase.split(" ").join("_")}.html"
  end

  def self.all
    @@all
  end

  def self.reset_movies!
    self.all.clear 
  end

  def self.make_movies!
    File.open("spec/fixtures/movies.txt") do |f|
      f.each_line do |line|
        movie_array = line.split("-")
        title = movie_array[0].strip
        release_date = movie_array[1].strip.to_i
        director = movie_array[2].strip
        summary = movie_array[3].strip
        line = Movie.new(title, release_date, director, summary)
      end
    end
  end

  def self.recent
    self.all.select do |movie|
      movie.release_date >= 2012
    end
  end

end






