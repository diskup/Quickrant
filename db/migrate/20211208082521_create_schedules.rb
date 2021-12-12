class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.references :shop, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :schedule_status, null: false, default: 0
      t.timestamps
    end
  end
end