class DeliverySlipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_delivery_slip, only: [:show, :edit, :update, :destroy]
  layout "dashboard"

  # GET /delivery_slips
  # GET /delivery_slips.json
  def index
    @delivery_slips = DeliverySlip.all
  end

  # GET /delivery_slips/1
  # GET /delivery_slips/1.json
  def show
  end

  # GET /delivery_slips/new
  def new
    @delivery_slip = DeliverySlip.new
    @orders = Order.all
    @customers = Customer.all
  end

  # GET /delivery_slips/1/edit
  def edit
    @orders = Order.all
    @customers = Customer.all
  end

  # POST /delivery_slips
  # POST /delivery_slips.json
  def create
    @delivery_slip = current_user.delivery_slips.build(delivery_slip_params)

    respond_to do |format|
      if @delivery_slip.save
        @delivery_slips = DeliverySlip.all
        format.html { redirect_to @delivery_slip, notice: 'Delivery slip was successfully created.' }
        format.json { render :show, status: :created, location: @delivery_slip }
        format.js
      else
        format.html { render :new }
        format.json { render json: @delivery_slip.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /delivery_slips/1
  # PATCH/PUT /delivery_slips/1.json
  def update
    respond_to do |format|
      if @delivery_slip.update(delivery_slip_params)
        @delivery_slips = DeliverySlip.all
        format.html { redirect_to @delivery_slip, notice: 'Delivery slip was successfully updated.' }
        format.json { render :show, status: :ok, location: @delivery_slip }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @delivery_slip.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @delivery_slip = DeliverySlip.find(params[:delivery_slip_id])
  end

  # DELETE /delivery_slips/1
  # DELETE /delivery_slips/1.json
  def destroy
    @delivery_slip.destroy
    @delivery_slips = DeliverySlip.all
    respond_to do |format|
      format.html { redirect_to delivery_slips_url, notice: 'Delivery slip was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delivery_slip
      @delivery_slip = DeliverySlip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def delivery_slip_params
      params.require(:delivery_slip).permit(:ref, :order_id, :customer_id)
    end
end
