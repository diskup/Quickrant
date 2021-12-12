class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :shop, foreign_key: true
      t.references :user, foreign_key: true
      t.float :value, null: false
      t.text :comment, null: false
      t.integer :about_price, null: false
      t.timestamps
    end
  end
end