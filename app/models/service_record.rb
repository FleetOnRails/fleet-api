class ServiceRecord < ActiveRecord::Base
  belongs_to :car

  has_many :documents, as: :documentable, dependent: :destroy
end
