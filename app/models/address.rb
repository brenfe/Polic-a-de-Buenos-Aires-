class Address < ApplicationRecord
  belongs_to :city
  validates :street, :number, :presence => true
  def direccion
    street + " " + number.to_s
  end
end
