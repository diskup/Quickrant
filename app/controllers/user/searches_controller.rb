class User::SearchesController < ApplicationController

  def search
    results = Geocoder.search(params[:location])
    if results.empty?
      flash[:notice] = "位置情報を取得できませんでした"
      redirect_to request.referer
    else
      latitude = results.first.coordinates[0]
      longitude = results.first.coordinates[1]
      distance = params[:distance].to_i
      shops = Shop.within(distance, origin: [latitude, longitude])
      @shops = shops
    end
  end

end
