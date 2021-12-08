class CreateRelationsips < ActiveRecord::Migration[5.2]
  def change
    create_table :relationsips do |t|

      t.timestamps
    end
  end
end
