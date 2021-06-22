class City < ApplicationRecord
  belongs_to :province
  validates :name, :presence => true
  validates :name, :uniqueness => true
  paginates_per 5
end
