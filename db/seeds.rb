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
for i in 1..10 do
  User.create(
    nickname: "a#{i}",
    email: "a#{i}@a",
    password: "aaaaaaa#{i}",
    current_prefectures: '東京都'
    )
end
for i in 1..10 do
  Shop.create(
    [
    {
      user_id: i,
      name: "お店#{i}",
      description: "#{i}番目のお店",
      minimum_price: 1000,
      max_price: 2000,
      prefectures: "東京都",
      address: "新宿区",
      phone_number: 000-0000-0000,
      is_active: 0
    }
    ]
  )
  Image.create(
    [
    {
      user_id: i,
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

for i in 1..10 do
  TagMap.create(
    [
    {
      tag_id: i,
      shop_id: i
    }
    ]
  )
end
for i in 1..10 do
  TagMap.create(
    [
    {
      tag_id: 11 - i,
      shop_id: i
    }
    ]
  )
end