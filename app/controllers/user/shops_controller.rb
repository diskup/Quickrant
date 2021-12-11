class User::ShopsController < ApplicationController
  def new
    @shop = Shop.new
  end

  def confirm
    @shop = Shop.new(shop_params)
  end

  def error
  end

  def create
    @shop = Shops.new(shop_params)
    @shop.user_id = current_user.id
    @shop.save
  end

  def thanks
  end

  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
  end

  private

  def shop_params
    params.require(:shop).permit(:prefectures, :city, :address, :name, :building_name, :description, :minimum_price, :max_price, :phone_number, :start_time, :end_time, :time_description, :is_active)
  end

end