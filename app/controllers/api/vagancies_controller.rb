class Api::VaganciesController < ApplicationController
  before_action :set_vagancy, only: [:show, :update, :destroy]

  # GET /vagancies
  def index
    @vagancies = Vagance.where(parking_id: params[:parking_id])

    render json: @vagancies
  end

  # GET /vagancies/1
  def show
    render json: @vagance
  end

  # POST /vagancies
  def create
    (1..params[:vagance][:number]).each do |i|
      
      number = Vagance.where(parking_id: params[:vagance][:parking_id]).last
      if number != nil
        @vagance = Vagance.create!(number: i, parking_id: params[:vagance][:parking_id])
      else
        i = i+number
        @vagance = Vagance.create!(number: i, parking_id: params[:vagance][:parking_id])

      end

    end  
    @vagances = Vagance.where(parking_id: params[:vagance][:parking_id])
    render json: @vagances, status: :created
    
  end

  def update
    if @vagance.update(vagance_params)
      render json: @vagance
    else
      render json: @vagance.errors, status: :unprocessable_entity
    end
  end
 
  def destroy
    @vagance.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vagance
      @vagance = Vagance.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vagancy_params
      params.require(:vagancie).permit
    end
end
# num = 3
# (1..num).each do |i|
#       number = Vagance.where(parking_id: 4).last
#       if number != nil
#       puts "**************#{i}**********"
#       puts "**************#{number.number}**********"
#         unless i == (number.number+1)
#           puts "*******entrou********"
#           i = 1 + number.number
#         end
#       end
#       a = number.number + 1
#        @vagance = Vagance.create!(number: i, parking_id: 4)

#  end  