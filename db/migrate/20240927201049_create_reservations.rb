class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :machine, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :vehicle, foreign_key: true
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.integer :status, default: 1
      t.timestamps
    end
  end
end
