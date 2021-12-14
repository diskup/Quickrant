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
User.create(
  nickname: 'a',
  email: 'a@a',
  password: 'aaaaaaaa',
  current_prefectures: 1
  )
for i in 1..10 do
  Shop.create(
    [
    {
      user_id: 1,
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
      user_id: 1,
      shop_id: i,
      shop_image: File.open("./app/assets/images/seed.image/no-image.png"),
      food_image: File.open("./app/assets/images/seed.image/no-image.png")
      }
    ]
  )
end