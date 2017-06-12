class Api::ParkingsController < ApiController
  before_action :set_parking, only: [:show, :update, :destroy]
  before_action :authenticate, only: [:create, :update, :delete]
  # GET /parkings
  def index
    @parkings = Parking.all

    render json: @parkings.to_json( include: { 
        address: { include: {
          city: { :only => [:id, :name], include: {
            state: {only: [:id,:name]}}
            }
          }, except: [:addressable_type, :addressable_id, :city_id]
        }, 
        
        user: { only: [:email, :name]}})
  end

  # GET /parkings/1
  def show
    render json: @parking.to_json( include: { 
        address: { include: {
          city: { :only => [:id, :name], include: {
            state: {only: [:id,:name]}}
            }
          }, except: [:addressable_type, :addressable_id, :city_id]
        }, 
        
        user: { only: [:email, :name]}, except: [:user_id]}) 
  end
  # POST /parkings
  def create
    @parking = Parking.new(parking_params)
    if @parking.save
      @address = Address.new(address_params)
      @address.addressable = @parking
      if @address.save
        render json: @parking, include: :address, status: :created
      else
        render json: @parking.errors, status: :unprocessable_entity
      end

    else  
        render json: @address.errors, status: :unprocessable_entity
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

    def address_params
      params.require(:address).permit!
    end
end
