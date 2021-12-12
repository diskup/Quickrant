class CreateRelationsips < ActiveRecord::Migration[5.2]
  def change
    create_table :relationsips do |t|
      t.references :following, foreign_key: {to_table: :users}
      t.references :followed, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end