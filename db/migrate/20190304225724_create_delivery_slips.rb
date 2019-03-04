class CreateDeliverySlips < ActiveRecord::Migration[5.1]
  def change
    create_table :delivery_slips do |t|
      t.string :ref
      t.references :order, foreign_key: true
      t.references :customer, foreign_key: true
      t.references :user, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
