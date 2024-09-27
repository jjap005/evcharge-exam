class CreateMachines < ActiveRecord::Migration[6.1]
  def change
    create_table :machines do |t|
      t.string :name
      t.string :model
      t.string :supplier
      t.references :location, null: false, foreign_key: true
      t.integer :status, default: 0
      t.datetime :last_maintenance_date
      t.timestamps
    end
  end
end