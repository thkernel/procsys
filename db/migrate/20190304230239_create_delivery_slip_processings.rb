class CreateDeliverySlipProcessings < ActiveRecord::Migration[5.1]
  def change
    create_table :delivery_slip_processings do |t|
      t.references :delivery_slip, foreign_key: true
      t.references :motif, foreign_key: true
      t.datetime :time_limit
      t.datetime :processing_date
      t.references :user, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
