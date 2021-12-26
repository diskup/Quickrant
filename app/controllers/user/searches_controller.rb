class User::SearchesController < ApplicationController

  def search
    # ジオコーダーの結果
    results = Geocoder.search(params[:location])
    # 結果がないときは全てのお店
    if results.empty?
      @shops = Shop.all
    else
    # ジオコーダーの結果を取得
      latitude = results.first.coordinates[0].to_f
      longitude = results.first.coordinates[1].to_f
      distance = params[:distance].to_i
    # 入力数値km圏内のお店を抽出
      @shops = Shop.within(distance, origin: [latitude, longitude])
    end
    # ↓キーワードを含む時の処理
    if params[:keyword].present?
    # まず店名が部分一致したお店を探す。
      keyword_shop = Shop.where('name LIKE ?', '%'+params[:keyword]+'%')
    # タグが一致したお店を追加するための空の配列を作成。
      tag_shops = []
    # キーワードと一致するタグを探す
      keyword_tag = Tag.find_by(tag_name: params[:keyword])
    # お店のタグと一致した時そのお店をshopsに追加する
      @shops.each do |shop|
    # それぞれのショップのtag_mapモデルの中にkeyword_tagがあるならtag_shopsにそのお店を追加。
        shop.tag_maps.each do |tag_map|
          if tag_map.tag == keyword_tag
            tag_shops << tag_map.shop
          end
        end
      end
      # 重複を除く
      @shops = (tag_shops + keyword_shop).uniq
    end

    # 選択した優先順位に応じて平均をとり並び替える処理

    if params[:sort] == "評価が良い"

      @shops.each do |shop|
        shop.average = shop.avg_score
      end
      @shops = @shops.sort { |x,y| y.average <=> x.average }
    else
      @shops.each do |shop|
        shop.average = shop.avg_price
      end
      @shops = @shops.sort { |x,y| x.average <=> y.average }
    end
    @shops_all = @shops.count
    @shops = Kaminari.paginate_array(@shops).page(params[:page]).per(10)
  end
end