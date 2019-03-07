class DeliverySlipProcessingsController < ApplicationController
  before_action :set_delivery_slip_processing, only: [:show, :edit, :update, :destroy]
  layout "dashboard"
  # GET /delivery_slip_processings
  # GET /delivery_slip_processings.json
  def index
    @delivery_slip_processings = DeliverySlipProcessing.all
  end

  # GET /delivery_slip_processings/1
  # GET /delivery_slip_processings/1.json
  def show
  end

  # GET /delivery_slip_processings/new
  def new
    @delivery_slip_processing = DeliverySlipProcessing.new
    @delivery_slips = DeliverySlip.all
    @motifs = Motif.all
  end

  # GET /delivery_slip_processings/1/edit
  def edit
    @delivery_slips = DeliverySlip.all
    @motifs = Motif.all
  end

  # POST /delivery_slip_processings
  # POST /delivery_slip_processings.json
  def create
    @delivery_slip_processing = current_user.delivery_slip_processings.build(delivery_slip_processing_params)

    respond_to do |format|
      if @delivery_slip_processing.save
        @delivery_slip_processings = DeliverySlipProcessing.all
        format.html { redirect_to @delivery_slip_processing, notice: 'Delivery slip processing was successfully created.' }
        format.json { render :show, status: :created, location: @delivery_slip_processing }
        format.js
      else
        format.html { render :new }
        format.json { render json: @delivery_slip_processing.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /delivery_slip_processings/1
  # PATCH/PUT /delivery_slip_processings/1.json
  def update
    respond_to do |format|
      if @delivery_slip_processing.update(delivery_slip_processing_params)
        @delivery_slip_processings = DeliverySlipProcessing.all
        format.html { redirect_to @delivery_slip_processing, notice: 'Delivery slip processing was successfully updated.' }
        format.json { render :show, status: :ok, location: @delivery_slip_processing }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @delivery_slip_processing.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @delivery_slip_processing = DeliverySlipProcessing.find(params[:delivery_slip_processing_id])
  end

  # DELETE /delivery_slip_processings/1
  # DELETE /delivery_slip_processings/1.json
  def destroy
    @delivery_slip_processing.destroy
    respond_to do |format|
      format.html { redirect_to delivery_slip_processings_url, notice: 'Delivery slip processing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delivery_slip_processing
      @delivery_slip_processing = DeliverySlipProcessing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def delivery_slip_processing_params
      params.require(:delivery_slip_processing).permit(:delivery_slip_id, :motif_id, :time_limit, :processing_date)
    end
end
