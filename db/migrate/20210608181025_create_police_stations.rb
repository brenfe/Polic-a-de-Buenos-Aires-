class CreatePoliceStations < ActiveRecord::Migration[6.1]
  def change
    create_table :police_stations do |t|
      t.references :address, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
