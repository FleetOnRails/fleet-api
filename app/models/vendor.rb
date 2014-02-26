class Vendor < ActiveRecord::Base
  belongs_to :venderable, polymorphic: true

  has_many :products, as: :productable
  has_one :location, as: :locationable
end
