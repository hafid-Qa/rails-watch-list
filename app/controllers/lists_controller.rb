class ListsController < ApplicationController
  def show
    @list = List.find(params[:id])
    @my_list_movies = @list.movies
    @movies = Movie.all
    @bookmark = Bookmark.new
    @not_in_my_list = Movie.where.not(id: @my_list_movies).order(title: :asc)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
