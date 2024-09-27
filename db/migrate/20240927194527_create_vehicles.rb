class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :name, null: false
      t.string :brand, null: false
      t.string :model, null: false
      t.integer :year, null: false
      t.references :user, null: false, foreign_key: true
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
