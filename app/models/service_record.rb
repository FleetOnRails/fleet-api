class ServiceRecord < ActiveRecord::Base
  has_many :documents, as: :documentable
end
