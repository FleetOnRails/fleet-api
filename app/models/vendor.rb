class Vendor < ActiveRecord::Base
  belongs_to :venderable, polymorphic: true

  has_many :products, as: :productable, dependent: :destroy
  has_one :location, as: :locationable, dependent: :destroy

  accepts_nested_attributes_for :location

  validates_presence_of :name
  validates_presence_of :supplies

  validates_associated :location
  validates_presence_of :location
end
