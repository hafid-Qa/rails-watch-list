class ListsController < ApplicationController
  def index
    
    redirect_to  root_path(@lists)
  end
end
