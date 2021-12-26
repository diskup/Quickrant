class User::ImagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def new
    @shop = Shop.find(params[:shop_id])
    @shop_image = Image.new
  end
  
  def create
    @shop = Shop.find(params[:shop_id])
    @shop_image = Image.new(shop_image_params)
    @shop_image.shop_id = params[:shop_id].to_i
    @shop_image.user_id = current_user.id
    @shop_image.save
    redirect_to shop_path(@shop)
  end
  
  def index
    @shop = Shop.find(params[:shop_id])
    @shop_images = @shop.images
  end
  private

  def shop_image_params
    params.require(:image).permit(:food_image, :shop_image)
  end
end