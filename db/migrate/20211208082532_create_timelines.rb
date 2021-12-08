class CreateTimelines < ActiveRecord::Migration[5.2]
  def change
    create_table :timelines do |t|
      t.integer :user_id, null: false
      t.integer :shop_id, null: false
      t.string :post_image_id, null: false
      t.text :description, null: false
      t.timestamps
    end
  end
end