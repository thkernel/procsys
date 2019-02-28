class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.references :service, foreign_key: true
      t.integer :contact
      t.references :motif, foreign_key: true
      t.datetime :time_limit
      t.datetime :processing_date
      t.boolean :status, default: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
