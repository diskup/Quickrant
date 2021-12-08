class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.integer :user_id, null: false
      t.integer :shop_id, null: false
      t.integer :schedule_status, null: false, default: 0
      t.timestamps
    end
  end
end