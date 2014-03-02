module Users
  class CreateService < BaseService
    def initialize(params)
      @params = params.dup
    end

    def execute
      user = User.new(@params)
      user.avatar = ::Avatars::CreateService.new.execute
      user.save!
      user
    end
  end
end