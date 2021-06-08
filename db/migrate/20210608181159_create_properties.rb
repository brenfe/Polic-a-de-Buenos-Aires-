class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.references :address, null: false, foreign_key: true
      t.string :details

      t.timestamps
    end
  end
end
