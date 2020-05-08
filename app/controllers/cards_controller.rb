class CardsController < ApplicationController
  def show
    
  end

  def new
    @list = List.find(params[:id])
    @card = @list.cards.build
  end

  def create
    list = List.find(params[:card][:list_id])
    @card = list.cards.build(card_params)
    if @card.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    if @card.update(card_params)
      render 'list/index'
    else
      render 'edit'
    end
  end

  def destroy
    
  end

  private
    def card_params
      params.require(:card).permit(:title, :memo)
    end
end
