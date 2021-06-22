class Defendant < ApplicationRecord
  belongs_to :person
  paginates_per 5
  def person_full_name
    person.nombre_completo
  end
end
