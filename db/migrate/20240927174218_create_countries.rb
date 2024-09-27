class CreateCountries < ActiveRecord::Migration[6.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :code, limit: 3
      t.string :continent
      t.string :currency
      t.boolean :available, default: true
      t.timestamps
    end
  end
end