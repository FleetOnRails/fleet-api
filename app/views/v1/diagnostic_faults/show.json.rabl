object @diagnostic_fault => :diagnostic_fault

attributes :id, :fault_code, :status

node :created_at do |object|
  object.created_at.to_time.to_i
end

node :updated_at do |object|
  object.updated_at.to_time.to_i
end
