class Document < ActiveRecord::Base
  belongs_to :documentable, polymorphic: true

  validates_presence_of :name
  validates_presence_of :media
end
