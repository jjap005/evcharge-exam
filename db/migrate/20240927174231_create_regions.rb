class CreateRegions < ActiveRecord::Migration[6.1]
  def change
    create_table :regions do |t|
      t.string :name
      t.references :country, null: false, foreign_key: true
      t.string :abbreviation, limit: 5
      t.boolean :available
      t.timestamps
    end
  end
end