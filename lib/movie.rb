require 'pry'
class Movie

  attr_accessor :id, :title, :release_date, :director, :summary

  @@all = []

  def initialize(title, release_date, director, summary)
    @id = id
    @title = title
    @release_date = release_date.to_i
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
        movie_array = line.split(" - ")
        Movie.new(*movie_array)
      end
    end
  end

  def self.recent
    self.all.select do |movie|
      movie.release_date >= 2012
    end
  end

end






