class CreateAirports < ActiveRecord::Migration[5.2]
  def change
    create_table :airports do |t|
      t.string :location
      t.string :code

      t.timestamps
    end
  end
end
