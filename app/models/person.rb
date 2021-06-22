class Person < ApplicationRecord
  belongs_to :address
  has_one :complainant
  paginates_per 5
  def nombre_completo
    first_name + " " + last_name
  end
end
