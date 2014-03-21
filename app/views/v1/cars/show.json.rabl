object @car => :car

attributes :id, :make, :model, :registration, :owner_id, :owner_type

node :current_gps_statistic do |car|
  partial('v1/cars/gps_statistic', :object => car.gps_statistics.last)
end

node :created_at do |object|
  object.created_at.to_time.to_i
end

node :updates_at do |object|
  object.created_at.to_time.to_i
end