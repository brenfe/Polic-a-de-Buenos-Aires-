class FixType < ActiveRecord::Migration[6.1]
  def self.up
    rename_column :damages, :type, :table_type
  end
end
