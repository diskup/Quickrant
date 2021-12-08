class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :shop_images
      t.string :tags
      t.string :tag_maps
      t.string :reviews
      t.string :schedules
      t.string :timelines
      t.string :image_favorites
      t.string :timeline_favorites
      t.string :shop__favorites
      t.string :fix_requests
      t.string :relationsips

      t.timestamps
    end
  end
end
