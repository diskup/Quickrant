class CreateImageFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :image_favorites do |t|
      t.integer :user_id, null: false
      t.integer :image_id, null: false
      t.timestamps
    end
  end
end