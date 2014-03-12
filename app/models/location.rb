class Location < ActiveRecord::Base
  belongs_to :locationable, polymorphic: true

  after_validation :geocode
  after_validation :reverse_geocode

  geocoded_by :address

  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      obj.address = geo.address
      obj.city = geo.city
      obj.county = geo.county
      obj.country = geo.country_code
    end
  end
end