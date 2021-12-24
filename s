
[1mFrom:[0m /home/ec2-user/environment/Quickrant/app/controllers/user/searches_controller.rb:6 User::SearchesController#search:

     [1;34m3[0m: [32mdef[0m [1;34msearch[0m
     [1;34m4[0m:   binding.pry
     [1;34m5[0m: 
 =>  [1;34m6[0m:   results = [1;34;4mGeocoder[0m.search(params[[33m:location[0m])
     [1;34m7[0m:   [32mif[0m results.empty?
     [1;34m8[0m:     flash[[33m:notice[0m] = [31m[1;31m"[0m[31m位置情報を取得できませんでした[1;31m"[0m[31m[0m
     [1;34m9[0m:     redirect_to request.referer
    [1;34m10[0m:   [32melse[0m
    [1;34m11[0m:     latitude = results.first.coordinates[[1;34m0[0m]
    [1;34m12[0m:     longitude = results.first.coordinates[[1;34m1[0m]
    [1;34m13[0m:     distance = params[[33m:distance[0m].to_i
    [1;34m14[0m:     @shops = [1;34;4mShop[0m.within(distance, [35morigin[0m: [latitude, longitude])
    [1;34m15[0m:     @shops.each [32mdo[0m |shop|
    [1;34m16[0m:       shop.average = shop.avg_score
    [1;34m17[0m:     [32mend[0m
    [1;34m18[0m:     @shops = @shops.sort_by { |shop| shop.average }
    [1;34m19[0m:   [32mend[0m
    [1;34m20[0m: [32mend[0m

