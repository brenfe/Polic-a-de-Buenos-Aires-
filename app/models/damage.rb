class Damage < ApplicationRecord
  belongs_to :person
  belongs_to :property
  paginates_per 5
end
