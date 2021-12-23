class User::FavoritesController < ApplicationC
  before_action :authenticate_user!

  def create
    @shop = Shop.find(params[:shop_id])
    favorite = current_user.favorites.new(shop_id: @shop.id, user_id: current_user.id)
    favorite.save
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    favorite = current_user.favorites.find_by(shop_id: @shop.id)
    favorite.destroy
  end

end
