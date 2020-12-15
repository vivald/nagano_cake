class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice]="Successfully Updated"
      redirect_to admin_genres_path
    else
      render :edit
    end
  end

  private

  def genre_params
    params.permit(:name, :is_active)
  end

end
