class User::ShopsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @shop = Shop.new
    @shop.images.build
  end

  def confirm
    @shop = Shop.new(shop_params)
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id
    tag_list = params[:shop][:tag_name].to_s.split(nil)
    if @shop.save
      @shop.save_tag(tag_list)
      redirect_to shop_path(@shop)
    else
      render :new
    end
  end

  def index
    if user_signed_in?
      @shops = Shop.where(prefectures: current_user.current_prefectures)
    else
      @shops = Shop.all
    end
  end

  def show
    @shop = Shop.find(params[:id])
    @review = Review.new
  end

  private

  def shop_params
    params.require(:shop).permit(:prefectures,
                                 :address,
                                 :name,
                                 :building_name,
                                 :description,
                                 :minimum_price,
                                 :max_price,
                                 :phone_number,
                                 :start_time,
                                 :end_time,
                                 :time_description,
                                 :is_active,
                                 :latitude,
                                 :longitude,
                                 images_attributes: [:shop_image,
                                                     :food_image,
                                                     :user_id
                                                    ]
                                )
  end
end