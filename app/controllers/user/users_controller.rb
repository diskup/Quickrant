class User::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update, :edit]

  def show
    @user = User.find(params[:id])
    @favorites = @user.favorites
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.followings
  end

  def followeds
    @user = User.find(params[:id])
    @users = @user.followeds
  end

  def favorites
    @user = User.find(params[:id])
    favorites = @user.favorites
    @shops = []
    favorites.each do |favorite|
      @shops << favorite.shop
    end
  end

  def reviews
    @user = User.find(params[:id])
    @reviews = @user.reviews.sort { |x,y| y.score <=> x.score }
  end

  def shops
    @user = User.find(params[:id])
    @shops = @user.shops
  end

  private
  def user_params
    params.require(:user).permit(:current_prefectures, :nickname, :introduction, :icon_image, :background_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end