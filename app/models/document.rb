class Document < ActiveRecord::Base
  belongs_to :documentable, polymorphic: true

  mount_uploader :media, DocumentUploader

  validates_presence_of :name
end
