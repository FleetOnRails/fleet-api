object @gps_statistic

attributes :kmh, :created_at

node :location do |gps_statistic|
  partial('v1/cars/location', :object => gps_statistic.location)
end