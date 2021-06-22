class Province < ApplicationRecord
  validates :name, :presence => true
  validates :name, :uniqueness => true
  paginates_per 5
end
