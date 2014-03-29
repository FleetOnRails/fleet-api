object @car => :car

attributes :id, :make, :model, :registration, :owner_id, :owner_type, :avatar_file, :avatar, :created_at, :updated_at

node :current_gps_statistic do |car|
  partial('v1/cars/gps_statistic', :object => car.gps_statistics.last)
end