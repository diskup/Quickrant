class User::ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @shop = Shop.find(params[:shop_id])
    @reviews = @shop.reviews
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.shop_id = params[:shop_id]
    @review.user_id = current_user.id
    if @review.save
      redirect_to shop_reviews_path(@review.shop)
    else
      @shop = Shop.find(params[:shop_id])
      redirect_to request.referer
    end
  end

  private
  def review_params
    params.require(:review).permit(:score, :content)
  end
end
