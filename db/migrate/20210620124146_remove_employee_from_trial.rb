class RemoveEmployeeFromTrial < ActiveRecord::Migration[6.1]
  def change
    remove_reference :trials, :employee, null: false, foreign_key: true
  end
end
