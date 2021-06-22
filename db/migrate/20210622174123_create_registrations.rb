class CreateRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :registrations do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :trial, null: false, foreign_key: true

      t.timestamps
    end
  end
end
