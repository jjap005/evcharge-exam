class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.references :city, null: false, foreign_key: true
      t.string :address
      t.integer :status, default: 1
      t.timestamps
    end
  end
end
