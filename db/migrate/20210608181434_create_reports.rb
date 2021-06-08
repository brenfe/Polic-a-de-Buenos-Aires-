class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.datetime :date
      t.string :details
      t.references :policeman, null: false, foreign_key: true
      t.references :complainant, null: false, foreign_key: true
      t.references :defendant, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :damage, null: false, foreign_key: true

      t.timestamps
    end
  end
end
