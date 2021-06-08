class CreateTrials < ActiveRecord::Migration[6.1]
  def change
    create_table :trials do |t|
      t.string :details
      t.datetime :date
      t.references :report, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
