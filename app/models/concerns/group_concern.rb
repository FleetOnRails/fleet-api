module GroupConcern
  extend ActiveSupport::Concern

  included do
  end

  module ClassMethods
    class << self
      def is_member?(user)
        users.each do |group_member|
          return true if group_member.id == user.id
        end
        false
      end
    end
  end
end