class CreateRelationsips < ActiveRecord::Migration[5.2]
  def change
    create_table :relationsips do |t|
      t.integer :following_id, null: false
      t.integer :followed_id, null: false
      t.timestamps
    end
  end
end