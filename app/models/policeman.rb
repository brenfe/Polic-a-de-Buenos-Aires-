class Policeman < ApplicationRecord
  belongs_to :person
  belongs_to :police_station
end
