class Employee < ApplicationRecord
  belongs_to :person
  paginates_per 5
  has_and_belongs_to_many :trials
  def person_full_name
    person.nombre_completo
  end
end
