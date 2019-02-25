class Api::V1::PetsController < ApplicationController
  before_action :set_api_v1_pet, only: [:show, :update, :destroy]

  # GET /api/v1/pets
  # GET /api/v1/pets.json
  def index
    @api_v1_pets = Api::V1::Pet.all
  end

  # GET /api/v1/pets/1
  # GET /api/v1/pets/1.json
  def show
  end

  # POST /api/v1/pets
  # POST /api/v1/pets.json
  def create
    @api_v1_pet = Api::V1::Pet.new(api_v1_pet_params)

    if @api_v1_pet.save
      render :show, status: :created, location: @api_v1_pet
    else
      render json: @api_v1_pet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/pets/1
  # PATCH/PUT /api/v1/pets/1.json
  def update
    if @api_v1_pet.update(api_v1_pet_params)
      render :show, status: :ok, location: @api_v1_pet
    else
      render json: @api_v1_pet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/pets/1
  # DELETE /api/v1/pets/1.json
  def destroy
    @api_v1_pet.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_pet
      @api_v1_pet = Api::V1::Pet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_pet_params
      params.fetch(:api_v1_pet, {})
    end
end
