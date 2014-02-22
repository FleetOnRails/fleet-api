class GroupCarJoin < ActiveRecord::Base
  belongs_to :car
  belongs_to :group
end
