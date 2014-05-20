class Document < ActiveRecord::Base
  mount_uploader :document, DocumentUploader

  belongs_to :documentable, polymorphic: true

  validates_presence_of :title
  # validates_presence_of :file_size
  validates_presence_of :document
end
