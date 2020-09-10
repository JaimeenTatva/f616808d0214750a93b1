module ExceptionHandler
    extend ActiveSupport::Concern

    included do
        rescue_from ActiveRecord::RecordNotFound do |e|
            json_response({ success: false, message: "No record found." }, :not_found)
        end

        rescue_from ActiveRecord::RecordInvalid do |e|
            json_response({ success: false, message: e.message }, :unprocessable_entity)
        end

        rescue_from ActionController::ParameterMissing do |e|
            json_response({ success: false, message: e.message }, :bad_request)
        end
    end
end