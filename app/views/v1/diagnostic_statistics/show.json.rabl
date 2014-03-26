object @diagnostic_statistic => :diagnostic_statistic

attributes :id, :kmh, :rpm, :l100km

node :created_at do |object|
  object.created_at.to_time.to_i
end

node :updated_at do |object|
  object.updated_at.to_time.to_i
end
