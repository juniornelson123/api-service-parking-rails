class Api::ParkingsController < ApiController
  before_action :set_parking, only: [:show, :update, :destroy]
  before_action :authenticate, only: [:create, :update, :delete]
  # GET /parkings

  def getCities
    @cities = City.order(name: :asc).where(state_id: params[:id])

    render json: @cities
  end

  def getStates
    @states = State.all.order(name: :asc)

    render json: @states
  end
  
  def index
    @parkings = Parking.all

    render json: @parkings.to_json( include: { 
        prices: { only: [:hour, :price] },
        vagances: { only: [:number, :status] },
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
        vagances: { only: [:number, :status] }, 
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
    if @parking.save!
      @address = Address.new(address_params)
      @address.addressable = @parking
      if @address.save!
        render json: @parking, include: :address, status: :created
      else
        render json: @address.errors, status: :unprocessable_entity
      end

    else  
        render json: @parking.errors, status: :unprocessable_entity
    end
  end


  def add_vagancies
    @vagance = Vagance.new(vagancie_params)

    if @vagance.save
      render json: @vagance
    else
      render json: @vagancie.errors, status: :unprocessable_entity
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

    def vagancie_params
      params.require(:vagancie).permit!
    end
end
