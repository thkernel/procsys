class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :ref
      t.datetime :order_date
      t.datetime :arrival_date
      t.references :order_type, foreign_key: true
      t.references :customer, foreign_key: true
      t.references :order_status, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
