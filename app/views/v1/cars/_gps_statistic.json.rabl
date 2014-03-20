object @gps_statistic

attributes :kmh

node :location do |gps_statistic|
  partial('v1/cars/location', :object => gps_statistic.location)
end

node :created_at do |gps_statistic|
  gps_statistic.created_at.to_time.to_i
end