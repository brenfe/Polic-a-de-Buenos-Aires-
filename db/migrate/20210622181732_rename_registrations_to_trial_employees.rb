class RenameRegistrationsToTrialEmployees < ActiveRecord::Migration[6.1]
  def change
    rename_table :registrations, :trial_employees
  end
end
