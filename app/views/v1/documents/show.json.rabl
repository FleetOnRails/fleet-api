object @document => :document

attributes :id, :name, :created_at, :updated_at

node :media_url do |document|
  document.media.url
end
