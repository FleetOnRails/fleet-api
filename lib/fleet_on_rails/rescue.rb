module FleetOnRails
  module Rescue

    class NotPrivileged < StandardError;
    end
    class DuplicateEntry < StandardError;
    end

    def self.included(base)
      base.rescue_from Exception do
        render status: 500, template: 'v1/errors/server_error'
      end

      base.rescue_from ActiveRecord::RecordInvalid do |object|
        @object = object.record
        render status: 400, template: 'v1/errors/record_invalid'
      end

      base.rescue_from ActiveRecord::RecordNotFound do
        render status: 404, template: 'v1/errors/record_not_found'
      end

      base.rescue_from ActiveRecord::RecordNotSaved do
        render status: 422, template: 'v1/errors/record_not_saved'
      end

      base.rescue_from NotPrivileged do
        render status: 403, template: 'v1/errors/not_privileged'
      end

      base.rescue_from DuplicateEntry do
        render status: 403, template: 'v1/errors/duplicate_entry'
      end
    end
  end
end

