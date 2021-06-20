class Property < ApplicationRecord
  belongs_to :address
  def propiedad
    address.direccion + ", " + details
  end
end
