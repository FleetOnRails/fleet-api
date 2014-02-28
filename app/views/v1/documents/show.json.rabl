object @document => :document

attributes :id, :name

node :media_url do |document|
  document.media.url
end
