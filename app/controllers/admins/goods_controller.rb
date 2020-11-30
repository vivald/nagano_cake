class Admins::GoodsController < ApplicationController
  def index
  end

  def new
    @item = Item.new(item_params)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] ="successfully Created"
      redirect_to admins_good_path(@item.id)
    else
      render :new
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
    params.permit(:name, :introduction, :image, :genre_id, :price, :is_active)
  end


end
