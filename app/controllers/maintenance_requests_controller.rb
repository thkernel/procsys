class MaintenanceRequestsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_maintenance_request, only: [:show, :edit, :update, :destroy]
  layout "dashboard"
  # GET /maintenance_requests
  # GET /maintenance_requests.json
  def index
    @maintenance_requests = MaintenanceRequest.all
  end

  # GET /maintenance_requests/1
  # GET /maintenance_requests/1.json
  def show
  end

  # GET /maintenance_requests/new
  def new
    @maintenance_request = MaintenanceRequest.new
    @stations = Station.all
  end

  # GET /maintenance_requests/1/edit
  def edit
    @stations = Station.all

  end

  # POST /maintenance_requests
  # POST /maintenance_requests.json
  def create
    @maintenance_request = current_user.maintenance_requests.build(maintenance_request_params)

    respond_to do |format|
      if @maintenance_request.save
        @stations = Station.all
        @maintenance_requests = MaintenanceRequest.all

        format.html { redirect_to @maintenance_request, notice: 'Maintenance request was successfully created.' }
        format.json { render :show, status: :created, location: @maintenance_request }
        format.js
      else
        format.html { render :new }
        format.json { render json: @maintenance_request.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /maintenance_requests/1
  # PATCH/PUT /maintenance_requests/1.json
  def update
    respond_to do |format|
      if @maintenance_request.update(maintenance_request_params)
        @stations = Station.all
        @maintenance_requests = MaintenanceRequest.all

        format.html { redirect_to @maintenance_request, notice: 'Maintenance request was successfully updated.' }
        format.json { render :show, status: :ok, location: @maintenance_request }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @maintenance_request.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @maintenance_request = MaintenanceRequest.find(params[:maintenance_request_id])
  end

  # DELETE /maintenance_requests/1
  # DELETE /maintenance_requests/1.json
  def destroy
    @maintenance_request.destroy
    @maintenance_requests = MaintenanceRequest.all

    respond_to do |format|
      format.html { redirect_to maintenance_requests_url, notice: 'Maintenance request was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance_request
      @maintenance_request = MaintenanceRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maintenance_request_params
      params.require(:maintenance_request).permit(:motif, :station_id)
    end
end
