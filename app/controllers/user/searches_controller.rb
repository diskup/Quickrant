class User::SearchesController < ApplicationController

  def search
    # ジオコーダーの結果
    results = Geocoder.search(params[:location])
    # 結果がないときは全てのお店
    if results.empty?
      @shops = Shop.all
    else
    # ジオコーダーの結果を取得
      latitude = results.first.coordinates[0]
      longitude = results.first.coordinates[1]
      distance = params[:distance].to_i
    # 入力数値km圏内のお店を抽出
      @shops = Shop.within(distance, origin: [latitude, longitude])
    end
    # ↓キーワードを含む時の処理
    if params[:keyword].present?
    # キーワードからタグを探す
      keyword = Tag.find_by(tag_name: params[:keyword])
    # 空の配列を作る
      shops = []
    # お店のタグと一致した時そのお店を空の配列に追加する 
      @shops.each do |shop|
        shop.tag_maps.each do |tag_map|
          if tag_map.tag == keyword
            shops << tag_map.shop
          end
        end
      end
      @shops = shops
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
  end
  
end