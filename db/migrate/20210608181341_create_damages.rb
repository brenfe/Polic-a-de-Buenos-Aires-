class CreateDamages < ActiveRecord::Migration[6.1]
  def change
    create_table :damages do |t|
      t.string :type
      t.references :person, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
