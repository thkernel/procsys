class ServicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  layout "dashboard"
  # GET /services
  # GET /services.json
  def index
    @services = Service.all
  end

  # GET /services/1
  # GET /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
    @services = Service.all
  end

  # POST /services
  # POST /services.json
  def create
    @service = current_user.services.build(service_params)
    @services = Service.all

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
        format.js
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update

    respond_to do |format|
      if @service.update(service_params)
        @services = Service.all
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @service = Service.find(params[:service_id])
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    @services = Service.all
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:name, :description)
    end
end
