# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

for i in 1..20 do
  User.create(
    nickname: "ユーザー#{i}",
    email: "a#{i}@a",
    password: "aaaaaaa#{i}",
    current_prefectures: '東京都'
    )
end
max = ["1500","2000","2500","3000","3500","4000","4500","5000"]
min = ["300","400","500","600","700","800","900","1000"]
array = ['千代田区', '中央区', '港区', '新宿区', '文京区', '台東区', '墨田区', '江東区', '品川区', '目黒区', '大田区', '世田谷区', '渋谷区', '中野区', '杉並区', '豊島区', '北区', '荒川区', '板橋区', '練馬区', '足立区', '葛飾区', '江戸川区']
for i in 1..300 do
  Shop.create(
    [
    {
      user_id: rand(1..20),
      name: "お店#{i}",
      description: "#{i}番目のお店",
      minimum_price: min.sample,
      max_price: max.sample,
      prefectures: "東京都",
      address: array.sample,
      phone_number: 000-0000-0000
    }
    ]
  )
  Image.create(
    [
    {
      user_id: rand(1..20),
      shop_id: i,
      shop_image: File.open("./app/assets/images/seed.image/no-image.png"),
      food_image: File.open("./app/assets/images/seed.image/no-image.png")
    }
    ]
  )
end
tag = ["中華","和食","イタリアン","フレンチ","鍋","カフェ","居酒屋","焼肉","寿司","ラーメン","洋食","ファミレス","バイキング","揚げ物","スイーツ"]
for i in 1..15 do
  Tag.create(
    [
    {
      tag_name: tag[i-1]
    }
    ]
  )
end

for i in 1..300 do
  TagMap.create(
    [
    {
      tag_id: rand(1..15),
      shop_id: rand(1..300)
    }
    ]
  )
  Image.create(
    [
      {
        user_id: rand(1..20),
        shop_id: i,
        shop_image: File.open("./app/assets/images/seed.image/no-image.png"),
        food_image: File.open("./app/assets/images/seed.image/no-image.png")
      }
      ]
    )
end
score = ["1","2","3","4","5"]
content = ["とても悪かった","微妙だった","普通だった","良かった","とても良かった"]
for i in 1..1000 do
  n = rand_num.sample.to_i
  Review.create(
    [
    {
      user_id: rand(1..20),
      shop_id: rand(1..300),
      score: n,
      content: content[n-1]
    }
    ]
    )
end
for i in 1..100 do
  Relationship.create(
    [
      {
      followed_id: rand(1..20),
      following_id: rand(1..20)
      }
      ]
    )
end