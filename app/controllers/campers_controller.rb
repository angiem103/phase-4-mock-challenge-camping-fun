class CampersController < ApplicationController
    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper
    rescue ActiveRecord::RecordNotFound
        record_not_found_response
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end

    private



    private
    def record_not_found_response
        render json: {error: "Camper Not Found"}, status: :not_found
    end

    def camper_params
        params.permit(:name, :age)
    end
end
