class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, only: :show
  layout 'public'

  def index
    @items = Item.page(params[:page]).per(8)
    @itemAmount = Item.count
    @customer = current_customer
  end

  def show
    @item = Item.find(params[:id])
    @customer = current_customer
  end










end
