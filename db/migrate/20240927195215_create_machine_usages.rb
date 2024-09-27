class CreateMachineUsages < ActiveRecord::Migration[6.1]
  def change
    create_table :machine_usages do |t|
      t.references :machine, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true
      t.datetime :start_time, null: false
      t.datetime :end_time
      t.decimal :billed_amount, precision: 10, scale: 2
      t.decimal :energy_used, precision: 10, scale: 2
      t.timestamps
    end
  end
end
