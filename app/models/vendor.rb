class Vendor < ActiveRecord::Base
  belongs_to :venderable, polymorphic: true

  has_many :products, as: :productable, dependent: :destroy
  has_one :location, as: :locationable, dependent: :destroy
end
