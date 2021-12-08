class CreateShopFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :shop__favorites do |t|

      t.timestamps
    end
  end
end
