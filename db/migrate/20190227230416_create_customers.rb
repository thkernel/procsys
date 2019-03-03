class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
     
      t.string :company
      t.string :full_name
      t.string :gender
      t.string :address
      t.string :city
      t.string :country
      t.string :phone
      t.string :slug, unique: true
      t.attachment :avatar
      t.boolean :status, default: true
      t.references :user, foreign_key: true, null: false, index:  true
     

      t.timestamps
    end
  end
end
