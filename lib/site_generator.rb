require 'pry'

class SiteGenerator

  def make_index!
    @movies = Movie.all

    beginning_of_string = "<!DOCTYPE html><html><head><title>Movies</title></head><body><ul>"
    
    movies_loop = @movies.collect do |movie|
      "<li><a href=\"movies/#{movie.url}\">#{movie.title}</a></li>"
    end.join("")

    end_of_string = "</ul></body></html>"

    full_string = "#{beginning_of_string}#{movies_loop}#{end_of_string}"
    File.write("_site/index.html", full_string)
  end

  def generate_pages!
    html = File.read("lib/templates/movie.html.erb")
    template = ERB.new(html)
    FileUtils.mkdir_p '_site/movies'

    @movies = Movie.all 
    @movies.each do |movie|
      @movie = movie 
      result = template.result(binding)
      File.write("_site/movies/#{movie.url}", result)
    end
  end

end