class CreateMaintenanceReports < ActiveRecord::Migration[5.1]
  def change
    create_table :maintenance_reports do |t|
      t.string :motif
      t.text :description
      t.references :work_order, foreign_key: true
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
