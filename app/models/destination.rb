class Destination < ActiveRecord::Base
  belongs_to :destinationable, polymorphic: true

  has_many :locations, as: :locationable
end
