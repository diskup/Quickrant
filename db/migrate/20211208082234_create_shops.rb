class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.integer :user_id, null: false
      t.string :prefectures, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.string :building_name, null: false
      t.float :longitude, null: false
      t.float :latitude, null: false
      t.text :description, null: false
      t.integer :minimum_price, null: false
      t.integer :max_price, null: false
      t.integer :phone_number, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.text :time_description, null: false
      t.integer :is_active, null: false, default: 0
      t.timestamps
    end
  end
end