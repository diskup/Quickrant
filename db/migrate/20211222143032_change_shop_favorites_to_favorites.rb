class ChangeShopFavoritesToFavorites < ActiveRecord::Migration[5.2]
  def change
    rename_table :shop__favorites, :favorites
  end
end
