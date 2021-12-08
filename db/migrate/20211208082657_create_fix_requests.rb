class CreateFixRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :fix_requests do |t|

      t.timestamps
    end
  end
end
