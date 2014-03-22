object @document => :document

attributes :id, :name

node :media_url do |document|
  document.media.url
end

node :created_at do |object|
  object.created_at.to_time.to_i
end

node :updated_at do |object|
  object.updated_at.to_time.to_i
end
