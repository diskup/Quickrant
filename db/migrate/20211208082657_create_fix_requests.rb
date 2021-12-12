class CreateFixRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :fix_requests do |t|
      t.references :shop, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :fix_status, null: false, default: 0
      t.text :user_message, null: false
      t.text :admin_mssage, null: false
      t.timestamps
    end
  end
end
