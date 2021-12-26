# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(
  email: 'admin@admin.com',
  password: 'quickrant'
  )
for i in 1..20 do
  User.create(
    nickname: "ユーザー#{i}",
    email: "a#{i}@a",
    password: "aaaaaaa#{i}",
    current_prefectures: '東京都'
    )
end
array = ['千代田区', '中央区', '港区', '新宿区', '文京区', '台東区', '墨田区', '江東区', '品川区', '目黒区', '大田区', '世田谷区', '渋谷区', '中野区', '杉並区', '豊島区', '北区', '荒川区', '板橋区', '練馬区', '足立区', '葛飾区', '江戸川区']
for i in 1..300 do
  Shop.create(
    [
    {
      user_id: rand(1..20),
      name: "お店#{i}",
      description: "#{i}番目のお店",
      minimum_price: rand(1..999).round(-1),
      max_price: rand(1000..10000).round(-2),
      prefectures: "東京都",
      address: array[rand(array.length)],
      phone_number: 000-0000-0000,
      is_active: 0
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

for i in 1..20 do
  Tag.create(
    [
    {
      tag_name: "タグ#{i}番"
    }
    ]
  )
end

for i in 1..300 do
  TagMap.create(
    [
    {
      tag_id: rand(1..20),
      shop_id: rand(1..300)
    }
    ]
  )
end
content = ["まあまあだった","微妙だった","良かった","とても良かった","とても悪かった"]
for i in 1..1000 do
  Review.create(
    [
    {
      user_id: rand(1..20),
      shop_id: rand(1..300),
      score: rand(1..5),
      content: content[rand(content.length)]
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