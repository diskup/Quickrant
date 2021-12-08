class CreateTimelineFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :timeline_favorites do |t|
      t.integer :user_id, null: false
      t.integer :timeline_id, null: false
      t.timestamps
    end
  end
end