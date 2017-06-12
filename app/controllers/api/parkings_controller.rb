class Api::ParkingsController < ApiController
  before_action :set_parking, only: [:show, :update, :destroy]
  before_action :authenticate, only: [:create, :update, :delete]
  # GET /parkings
  def index
    @parkings = Parking.all

    render json: @parkings
  end

  # GET /parkings/1
  def show
    render json: @parking.to_json(
               include: {
                 user: { only: [:email, :name]}
               }) 
  end
  # POST /parkings
  def create
    @parking = Parking.new(parking_params)
    

    if @parking.save
      render json: @parking, status: :created
    else
      render json: @parking.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /parkings/1
  def update
    if @parking.update(parking_params)
      render json: @parking
    else
      render json: @parking.errors, status: :unprocessable_entity
    end
  end

  # DELETE /parkings/1
  def destroy
    @parking.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking
      begin
        @parking = Parking.find(params[:id])
      rescue
        head 404
      end
    end

    # Only allow a trusted parameter "white list" through.
    def parking_params
      params.require(:parking).permit!
    end
end
