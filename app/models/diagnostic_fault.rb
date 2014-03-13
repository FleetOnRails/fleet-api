class DiagnosticFault < ActiveRecord::Base
  belongs_to :car

  validates_presence_of :fault_code
  validates_presence_of :status

  validate :status, :inclusion => {:in => [true, false]}
end
