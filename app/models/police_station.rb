class PoliceStation < ApplicationRecord
  belongs_to :address
  validates :name, :uniqueness => true
  validates :name, :presence => true
end
