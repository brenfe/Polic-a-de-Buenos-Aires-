class CreatePolicemen < ActiveRecord::Migration[6.1]
  def change
    create_table :policemen do |t|
      t.references :person, null: false, foreign_key: true
      t.references :police_station, null: false, foreign_key: true

      t.timestamps
    end
  end
end
