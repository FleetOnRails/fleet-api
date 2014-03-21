object @gps_statistic

attributes :kmh, :latitude, :longitude

node :created_at do |gps_statistic|
  gps_statistic.created_at.to_time.to_i
end