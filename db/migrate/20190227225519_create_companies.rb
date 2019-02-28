class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :address
      t.string :city
      t.string :country
      t.string :phone
      t.string :slug, unique: true
      t.attachment :brand
      #t.references :app_config, foreign_key: true, null: false, index: {unique: true}
      t.references :user, foreign_key: true, null: false, index: {unique: true}

      t.timestamps
    end
  end
end
