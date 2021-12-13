class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references :shop, foreign_key: true
      t.references :user, foreign_key: true
      t.string :food_image_id
      t.string :shop_image_id
      t.timestamps
    end
  end
end