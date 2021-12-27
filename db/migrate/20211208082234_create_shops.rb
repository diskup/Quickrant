class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.references :user, foreign_key: true
      t.string :prefectures, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.string :building_name
      t.float :longitude
      t.float :latitude
      t.text :description, null: false
      t.integer :minimum_price, null: false
      t.integer :max_price, null: false
      t.string :phone_number
      t.time :start_time
      t.time :end_time
      t.text :time_description
      t.timestamps
    end
  end
end