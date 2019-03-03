class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  layout "dashboard"

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
    
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @customers = Customer.all
    @order_types = OrderType.all
    @order_statuses = OrderStatus.all
  end

  # GET /orders/1/edit
  def edit
    @customers = Customer.all
    @order_types = OrderType.all
    @order_statuses = OrderStatus.all
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = current_user.orders.build(order_params)

    respond_to do |format|
      if @order.save
        @orders = Order.all
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
        format.js
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        @orders = Order.all
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @order = Order.find(params[:order_id])
  end
  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    @orders = Order.all
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:ref, :arrival_date, :order_type_id, :customer_id, :order_status_id)
    end
end
