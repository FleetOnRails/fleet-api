object @gps_statistic => :gps_statistic

attributes :id, :kmh, :latitude, :longitude

node :created_at do |object|
  object.created_at.to_time.to_i
end

node :updates_at do |object|
  object.created_at.to_time.to_i
end
