class Destination < ActiveRecord::Base
  belongs_to :destinationable, polymorphic: true

  has_one :location, as: :locationable, dependent: :destroy
end
