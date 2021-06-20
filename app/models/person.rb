class Person < ApplicationRecord
  belongs_to :address
  has_one :complainant
  def nombre_completo
    first_name + " " + last_name
  end
end
