class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :shop_id, null: false
      t.integer :user_id, null: false
      t.float :value, null: false
      t.text :comment, null: false
      t.integer :about_price, null: false
      t.timestamps
    end
  end
end