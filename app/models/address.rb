class Address < ApplicationRecord
  belongs_to :city
  validates :street, :number, :presence => true
  paginates_per 5
  def direccion
    street + " " + number.to_s
  end
end
