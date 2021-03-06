class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.references :province, null: false, foreign_key: true
      t.string :name
      t.integer :zip_code

      t.timestamps
    end
  end
end
