class Damage < ApplicationRecord
  belongs_to :person
  belongs_to :property
end
