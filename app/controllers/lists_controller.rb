class ListsController < ApplicationController
  def show
    @list = List.find(params[:id])
    @my_list_movies = @list.movies
    @movies = Movie.all
    @bookmark = Bookmark.new
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

  # def update
  #   @list = List.find(params[:id])
  #   redirect_to list_path(@list)
  # end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
