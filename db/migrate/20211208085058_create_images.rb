class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.integer :user_id, null: false
      t.string :food_image_id, null: false
      t.string :shop_image_id, null: false
      t.timestamps
    end
  end
end