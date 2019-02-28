class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :name#, null: false
      t.text :description
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
