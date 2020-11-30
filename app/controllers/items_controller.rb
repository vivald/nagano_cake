class ItemsController < ApplicationController
  def index
  end

  def show
  end

  def create
     @item = Item.new(item_params)
    if @item.save
      flash[:notice] ="successfully Created"
      redirect_to admins_good_path(@item.id)
    else
      redirect_to new_admins_good_path
    end
  end


  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :genre_id, :price, :is_active)
  end
end
