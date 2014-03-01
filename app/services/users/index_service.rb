module Users
  class IndexService < BaseService
    def initialize
    end

    def execute
      User.all
    end
  end
end