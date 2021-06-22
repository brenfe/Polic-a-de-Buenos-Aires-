class Property < ApplicationRecord
  belongs_to :address
  paginates_per 5
  def propiedad
    address.direccion + ", " + details
  end
end
