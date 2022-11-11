class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @lists = List.all
    @list = List.new
  end
end
