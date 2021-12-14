class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :shop, foreign_key: true
      t.references :user, foreign_key: true
      t.float :score, null: false
      t.text :content
      t.timestamps
    end
  end
end