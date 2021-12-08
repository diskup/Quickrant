class CreateShopFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :shop__favorites do |t|
      t.integer :user_id, null: false
      t.integer :shop_id, null: false
      t.timestamps
    end
  end
end