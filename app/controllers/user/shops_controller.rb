class User::ShopsController < ApplicationController
  def new
    @shop = Shop.new
    @tag_list = Tag.all
    @image = Image.new
  end

  def confirm
    @shop = Shop.new(shop_params)
  end

  def error
  end

  def create
    @shop = current_user.shop.new(shop_params)           
    tag_list = params[:shop][:tag_name].split(nil)
    if @shop.save
      @shop.save_shops(tag_list)
      redirect_to shops_path
    else
      @image = @shop.image.new(image_params)
      @image.save
      render :new
    end 
  end
  
  def index
    @shops = Shop.all
    @tag_list = Tag.all 
  end

  def show
    @shop = shop.find(params[:id])
    @shop_tags = @shop.tags 
  end

  private

  def shop_params
    params.require(:shop).permit(:prefectures, :address, :name, :building_name, :description, :minimum_price, :max_price, :phone_number, :start_time, :end_time, :time_description, :is_active)
  end
  def image_params
    params.require(:image).permit(:food_image_id, :shop_image_id)
  end 
end