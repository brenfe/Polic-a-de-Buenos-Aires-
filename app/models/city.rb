class City < ApplicationRecord
  belongs_to :province
  validates :name, :presence => true
  validates :name, :uniqueness => true
end
