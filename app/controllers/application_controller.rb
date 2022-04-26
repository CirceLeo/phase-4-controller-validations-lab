class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :bad_data

    private
    def bad_data invalid
        render json: {errors: invalid.record.errors.full_messages}, status: unprocessable_entity
    end
end
