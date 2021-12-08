class CreateTimelineFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :timeline_favorites do |t|

      t.timestamps
    end
  end
end
