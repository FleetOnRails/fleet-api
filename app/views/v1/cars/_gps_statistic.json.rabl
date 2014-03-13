object @gps_statistic

attributes :kmh

node :location do |gps_statistic|
  partial('v1/cars/location', :object => gps_statistic.location)
end