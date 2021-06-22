class Trial < ApplicationRecord
  belongs_to :report
  has_and_belongs_to_many :employees
  paginates_per 5
end
