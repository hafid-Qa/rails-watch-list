class ListsController < ApplicationController
  def show
    @list = List.find(params[:id])
    @my_list_movies = @list.movies
  end
end
