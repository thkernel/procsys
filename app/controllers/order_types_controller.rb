class OrderTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order_type, only: [:show, :edit, :update, :destroy]
  layout "dashboard"

  # GET /order_types
  # GET /order_types.json
  def index
    @order_types = OrderType.all
  end

  # GET /order_types/1
  # GET /order_types/1.json
  def show
  end

  # GET /order_types/new
  def new
    @order_type = OrderType.new
  end

  # GET /order_types/1/edit
  def edit
  end

  # POST /order_types
  # POST /order_types.json
  def create
    @order_type = current_user.order_types.build(order_type_params)

    respond_to do |format|
      if @order_type.save
        @order_types = OrderType.all
        format.html { redirect_to @order_type, notice: 'Order type was successfully created.' }
        format.json { render :show, status: :created, location: @order_type }
        format.js
      else
        format.html { render :new }
        format.json { render json: @order_type.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /order_types/1
  # PATCH/PUT /order_types/1.json
  def update
    respond_to do |format|
      if @order_type.update(order_type_params)
        @order_types = OrderType.all
        format.html { redirect_to @order_type, notice: 'Order type was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_type }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @order_type.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @order_type = OrderType.find(params[:order_type_id])
  end

  # DELETE /order_types/1
  # DELETE /order_types/1.json
  def destroy
    @order_type.destroy
    @order_types = OrderType.all
    respond_to do |format|
      format.html { redirect_to order_types_url, notice: 'Order type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_type
      @order_type = OrderType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_type_params
      params.require(:order_type).permit(:name, :description)
    end
end
