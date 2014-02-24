class Car < ActiveRecord::Base
  belongs_to :drivable, polymorphic: true
end
