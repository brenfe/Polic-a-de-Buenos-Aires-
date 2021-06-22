class Report < ApplicationRecord
  belongs_to :policeman
  belongs_to :complainant
  belongs_to :defendant
  belongs_to :category
  belongs_to :damage
  paginates_per 5
end
