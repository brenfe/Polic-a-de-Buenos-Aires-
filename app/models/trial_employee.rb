class TrialEmployee < ApplicationRecord
  belongs_to :employee
  belongs_to :trial
end
