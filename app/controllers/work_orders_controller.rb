class WorkOrdersController < ApplicationController
  before_action :authenticate_user!

  before_action :set_work_order, only: [:show, :edit, :update, :destroy]
  layout "dashboard"
  # GET /work_orders
  # GET /work_orders.json
  def index
    @work_orders = WorkOrder.all
  end

  # GET /work_orders/1
  # GET /work_orders/1.json
  def show
  end

  # GET /work_orders/new
  def new
    @work_order = WorkOrder.new
    @maintenance_requests = MaintenanceRequest.all
  end

  # GET /work_orders/1/edit
  def edit
    @maintenance_requests = MaintenanceRequest.all

  end

  # POST /work_orders
  # POST /work_orders.json
  def create
    @work_order = current_user.work_orders.build(work_order_params)

    respond_to do |format|
      if @work_order.save
        @work_orders = WorkOrder.all
        format.html { redirect_to @work_order, notice: 'Work order was successfully created.' }
        format.json { render :show, status: :created, location: @work_order }
        format.js
      else
        format.html { render :new }
        format.json { render json: @work_order.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /work_orders/1
  # PATCH/PUT /work_orders/1.json
  def update
    respond_to do |format|
      if @work_order.update(work_order_params)
        @work_orders = WorkOrder.all
        format.html { redirect_to @work_order, notice: 'Work order was successfully updated.' }
        format.json { render :show, status: :ok, location: @work_order }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @work_order.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @work_order = WorkOrder.find(params[:work_order_id])
  end

  # DELETE /work_orders/1
  # DELETE /work_orders/1.json
  def destroy
    @work_order.destroy
    @work_orders = WorkOrder.all
    respond_to do |format|
      format.html { redirect_to work_orders_url, notice: 'Work order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_order
      @work_order = WorkOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_order_params
      params.require(:work_order).permit(:motif, :maintenance_request_id)
    end
end
