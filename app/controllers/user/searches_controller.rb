class User::SearchesController < ApplicationController

  def search
    results = Geocoder.search(params[:location])
    if results.empty?
      flash[:notice] = "検索できませんでした。"
      redirect_to root_path
    else
      selection = params[:keyword]
      latitude = results.first.coordinates[0]
      longitude = results.first.coordinates[1]
      shops = Shop.within_box(20, latitude, longitude)
      case selection
      when 'near'
        get_distance_shops = shops.each { |shop| shop.distance_from([latitude, longitude]) }
        @shops = get_distance_shops.sort_by { |a| a.distance }
      else
        @shops = shops
      end
    end
  end

end
