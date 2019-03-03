class CreateOrderStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :order_statuses do |t|
      t.string :name
      t.text :description
      t.references :user, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end
