class Product < ActiveRecord::Base
  belongs_to :productable, polymorphic: true

  validates_presence_of :name
  validates_presence_of :price
  validates_presence_of :part_no
end
