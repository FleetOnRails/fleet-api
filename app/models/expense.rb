class Expense < ActiveRecord::Base
  belongs_to :car

  has_many :documents, as: :documentable, dependent: :destroy
  has_one :location, as: :locationable, dependent: :destroy

  accepts_nested_attributes_for :location

  validates_presence_of :date
  validates_presence_of :odometer
  validates_presence_of :price
  validates_presence_of :expense_type
  validates_presence_of :description

  validates_associated :location
  validates_presence_of :location
end
