class ListsController < ApplicationController
  def index
    @lists = current_user.lists
  end

  def new
    @list = current_user.lists.build
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update

  end

  private
    def list_params
      params.require(:list).permit(:title)
    end
end
