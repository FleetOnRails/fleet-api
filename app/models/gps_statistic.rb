class GpsStatistic < ActiveRecord::Base
  belongs_to :car

  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      obj.address = geo.address
      obj.city = geo.city
      obj.county = geo.county
      obj.country = geo.country_code
    end
  end

  after_validation :reverse_geocode # auto-fetch address
end
