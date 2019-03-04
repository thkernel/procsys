class AlterTasks < ActiveRecord::Migration[5.1]
  def change
    change_table :tasks do |t|
      
      t.references :order, foreign_key: true
      
    end
  end
end
