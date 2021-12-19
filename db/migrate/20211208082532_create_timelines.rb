class CreateTimelines < ActiveRecord::Migration[5.2]
  def change
    create_table :timelines do |t|
      t.references :shop, foreign_key: true
      t.references :user, foreign_key: true
      t.string :post_image_id, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end