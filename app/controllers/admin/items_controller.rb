class Admin::ItemsController < ApplicationController
  before_action :authenticate_customer!
  layout 'admin'

  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] ="successfully Created"
      redirect_to admin_item_path(@item.id)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @genre = @item.genre.name
    # 右辺の@item.genreの部分はitemがgenreに紐づいているデータを呼び出している。@itemはitemの一つのデータ
    # genre.nameでgenreモデルからnameを指定して呼び出している。
    @addTax = @item.price * 1.10
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice]= "successfully Updated"
      redirect_to admin_item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :image, :genre_id, :price, :is_active)
  end


end
