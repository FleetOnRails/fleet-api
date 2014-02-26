class Location < ActiveRecord::Base
  include LocationConcern

  belongs_to :locationable, polymorphic: true
end
