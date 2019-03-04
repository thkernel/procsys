class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.string :ref
      t.string :address
      t.string :city
      t.string :phone
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
