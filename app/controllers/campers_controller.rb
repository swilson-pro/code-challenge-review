class CampersController < ApplicationController
    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = Camper.find_by(id: params[:id])
        if camper
        render json: camper, only: [:id, :name, :age], include: [:activities]
        else
            render json: {errors: "Camper not found"}, status: 404
        end
    end
    def create
        camper = Camper.create(camper_params)
        if camper.valid?
            render json: camper, only: [:id, :name, :age], status: 201
        else
            render json: {errors: camper.errors.full_messages}, status: 422
        end
    end

    # def create
    #     camper = Camper.new(name: params[:name], age: params[:age])
    #     if camper.save
    #         render json: camper, only: [:id, :name, :age], status: 201
    #     else
    #         render json: {errors: camper.errors.full_messages}, status: 422
    #     end
    # end

    private

    def camper_params
        params.permit(:name, :age)
    end
end
