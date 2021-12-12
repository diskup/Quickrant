class CreateTimelineFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :timeline_favorites do |t|
      t.references :timeline, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end