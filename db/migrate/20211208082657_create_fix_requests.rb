class CreateFixRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :fix_requests do |t|
      t.integer :user_id, null: false
      t.integer :shop_id, null: false
      t.integer :fix_status, null: false, default: 0
      t.text :user_message, null: false
      t.text :admin_mssage, null: false
      t.timestamps
    end
  end
end
