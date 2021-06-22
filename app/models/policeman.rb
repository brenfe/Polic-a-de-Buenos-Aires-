class Policeman < ApplicationRecord
  belongs_to :person
  belongs_to :police_station
  paginates_per 5
  def person_full_name
    person.nombre_completo
  end
end
