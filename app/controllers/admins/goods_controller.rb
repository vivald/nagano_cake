class Admins::GoodsController < ApplicationController
  def index
  end

  def new
    @items = Item.new(item_params)
  end

  def create
    @items = Item.new(item_params)
    if @items.save
      flash[:notice] ="successfully Created"
      redirect_to admins_good_path(@item.id)
    else
      redirect_to new_admins_good_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :image_id, :introduction, :price, :is_actice)
  end
end
