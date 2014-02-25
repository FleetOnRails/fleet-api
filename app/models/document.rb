class Document < ActiveRecord::Base
  belongs_to :documentable, polymorphic: true

  mount_uploader :document, DocumentUploader
end
