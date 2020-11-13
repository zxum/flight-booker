class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.datetime :time
      t.time :duration
      t.integer :to_airport_id
      t.integer :from_airport_id

      t.timestamps
    end
  end
end
