class CreateImageFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :image_favorites do |t|

      t.timestamps
    end
  end
end
