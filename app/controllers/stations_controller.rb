class StationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_station, only: [:show, :edit, :update, :destroy]
  layout "dashboard"
  # GET /stations
  # GET /stations.json
  def index
    @stations = Station.all
  end

  # GET /stations/1
  # GET /stations/1.json
  def show
  end

  # GET /stations/new
  def new
    @station = Station.new
  end

  # GET /stations/1/edit
  def edit
  end

  # POST /stations
  # POST /stations.json
  def create
    @station = current_user.stations.build(station_params)

    respond_to do |format|
      if @station.save
        @stations = Station.all

        format.html { redirect_to @station, notice: 'Station was successfully created.' }
        format.json { render :show, status: :created, location: @station }
        format.js
      else
        format.html { render :new }
        format.json { render json: @station.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /stations/1
  # PATCH/PUT /stations/1.json
  def update
    respond_to do |format|
      if @station.update(station_params)
        @stations = Station.all

        format.html { redirect_to @station, notice: 'Station was successfully updated.' }
        format.json { render :show, status: :ok, location: @station }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @station.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @station = Station.find(params[:station_id])
  end

  # DELETE /stations/1
  # DELETE /stations/1.json
  def destroy
    @station.destroy
    @stations = Station.all

    respond_to do |format|
      format.html { redirect_to stations_url, notice: 'Station was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station
      @station = Station.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def station_params
      params.require(:station).permit(:ref, :address, :city, :phone)
    end
end
