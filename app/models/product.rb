class Product < ActiveRecord::Base
  belongs_to :productable, polymorphic: true
end
