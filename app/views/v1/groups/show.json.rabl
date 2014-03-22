object @group => :group

attributes :id, :name

node :avatar_url do |group|
  group.avatar.url
end

node :location do |group|
  partial('v1/groups/location', :object => group.location)
end

node :created_at do |object|
  object.created_at.to_time.to_i
end

node :updated_at do |object|
  object.updated_at.to_time.to_i
end