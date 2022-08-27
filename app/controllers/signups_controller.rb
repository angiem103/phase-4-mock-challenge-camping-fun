class SignupsController < ApplicationController
    def create
        signup = Signup.create!(signup_params)
        render json: signup, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end

    private

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end
end
