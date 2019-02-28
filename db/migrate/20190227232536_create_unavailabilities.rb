class CreateUnavailabilities < ActiveRecord::Migration[5.1]
  def change
    create_table :unavailabilities do |t|
      t.integer :actor
      t.datetime :unavailability_date
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
