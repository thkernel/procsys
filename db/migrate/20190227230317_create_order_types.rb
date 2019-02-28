class CreateOrderTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :order_types do |t|
      t.string :name
      t.text :description
      t.boolean :status, default: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
