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
    if params[:option].present?
      # ログイン時の処理
      if user_signed_in?
        # 空の配列shopを作成
        shops = []
        # タイトル
        @shops_title = params[:option]
        # ログインユーザーがフォローしているユーザーが4以上のスコアで評価し、平均スコアが3以上のお店をshopsに格納
        if params[:option] == "フォローユーザーの高評価店舗"
          current_user.followings.each do |user|
            user.reviews.each do |review|
              if review.score >= 4 && review.shop.avg_score > 3
                shops << review.shop
              end
            end
          end
          # 重複削除
          shops = shops.uniq
        # ログインユーザーがフォローしているユーザーが登録した店舗をshopsに格納
        elsif params[:option] == "フォローユーザーの登録店舗"
          current_user.followings.each do |user|
            shops = shops + user.shops
          end
        # ログインユーザーのcurrent_prefecturesのお店を格納
        else
          shops = Shop.where(prefectures: current_user.current_prefectures)
        end
      # ログインしていない時の処理
      else
        @shops_title = params[:option] + "のおすすめ"
        # 選択された都道府県のお店を格納
        shops = Shop.where(prefectures: params[:option])
      end
      # フォローユーザーの登録店舗の時だけ投稿日が新しい順に並び替え、それ以外はお店の評価が高い順に並び替え
      unless params[:option] == "フォローユーザーの登録店舗"
        shops.each do |shop|
          shop.average = shop.avg_score
        end
        @shops = shops.sort { |x,y| y.average <=> x.average }
      else
        @shops = shops.sort { |x,y| y.created_at <=> x.created_at }
      end
      # kaminariの設定
      @shops = Kaminari.paginate_array(@shops).page(params[:page]).per(10)
    # urlを直接入力した時用
    else
      @shops = Shop.all.page(params[:page]).per(10)
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