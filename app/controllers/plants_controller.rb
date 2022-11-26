class PlantsController < ApplicationController
    def index
        plants= Plant.all
        render json: plants
    end
    def show
        plant = Plant.find_by(id: params[:id])
        if plant
            render json: plant
        else
            render json: {error: "No plant found"}, status: :not_found
        end
    end
    def create
        plant = Plant.create(plant_params)
        render json: plant, status: :created
    end
    private
    def plant_params
        params.permit(:name, :image, :price)
    end
    def update
        plant = Plant.find_by(id: params[:id])
        plant.update(plant_params)
        render json: plant
    end
    def destroy
        plant = Plant.find_by(id: params[:id])
        plant.destroy
        head :no_content
    end
end