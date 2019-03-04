class CreatePrestators < ActiveRecord::Migration[5.1]
  def change
    create_table :prestators do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :phone
      t.string :country
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
