object @group => :group

attributes :id, :name

node :media_url do |group|
  group.avatar.url
end
