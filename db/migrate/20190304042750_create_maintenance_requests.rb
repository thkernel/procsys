class CreateMaintenanceRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :maintenance_requests do |t|
      t.string :motif
      t.references :station, foreign_key: true
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
