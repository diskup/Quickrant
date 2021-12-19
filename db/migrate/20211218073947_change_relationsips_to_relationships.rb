class ChangeRelationsipsToRelationships < ActiveRecord::Migration[5.2]
  def change
    rename_table :relationsips, :relationships
  end
end
