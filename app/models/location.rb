class Location < ActiveRecord::Base
  belongs_to :locationable, polymorphic: true

  validate :has_locationable_field?

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

  # FIXME - provide better validation here
  def has_locationable_field?
    if latitude.blank? and longitude.blank? and address.blank?
      errors.add :base, 'You must fill in at least one field'
    end
  end
end
